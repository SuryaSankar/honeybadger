namespace :karpeer_admin do
  desc "adding question paper"
  task :push_qpapers, [:qpaper] => :environment do |t, args|
	q_no=0;
	subq_no=0;
	subsubq_no=0;
	univ=nil;
	qpaper=nil;
	userid = Admin.first.user_id

	IO.foreach(args.qpaper) do |line|
		case line
		when /^!START_QPAPER_DESC!$/
			univ=nil;
			qpaper=Qpaper.new
		when /^!University!\s+(?<university>.*)$/
			univ = University.find_by name: $~[:university]
		when /^!CourseCode!\s+(?<coursecode>.*)$/
			course = UniversityCourse.find_by university_id: univ.id, course_code: $~[:coursecode]
			qpaper.university_course_id = course.id
		when /^!ExamName!\s+(?<exam_name>.*)$/
			qpaper.exam_name = $~[:exam_name]
		when /^!Title!\s+(?<title>.*)$/
			qpaper.title = $~[:title]
		when /^!Year!\s+(?<year>.*)$/
			qpaper.year = $~[:year].to_i
		when /^!Month!\s+(?<month>.*)$/
			qpaper.month = $~[:month]
		when /^!Semester!\s+(?<semester>.*)$/
			qpaper.semester = $~[:semester]
		when /^!END_QPAPER_DESC!$/
			qpaper.user_id = userid
			qpaper.save!
		when /^!START_QPAPER!$/
			q_no=0;
			subq_no=0;
			subsubq_no=0;			
		when /^(?<qno>[0-9]+)\.\s*(?<qtext>.*)\s*\((?<mark>\d+)\)\s*$/
			q_no = $~[:qno]
			subq_no=0;
			subsubq_no=0;
			q = Question.where(qtext: $~[:qtext].strip).first_or_create
			q.update_attributes(user_id: userid) if q.user_id = nil
			eq = Examquestion.create qnumber: q_no, qpaper_id: qpaper.id, mark: $~[:mark], question_id: q.id, user_id: userid
		when /^(?<qno>[0-9]+)\.\s$/
			q_no = $~[:qno]
			subq_no=0;
			subsubq_no=0;
		when /^\((?<subq>[a-zA-Z])\)\s+$/
			subq_no+=1;
			subsubq_no=0;
		when /^\((?<subq>[a-zA-Z])\)\s*(?<qtext>.*)\s*\((?<mark>\d+)\)\s*$/
			subq_no+=1;
			subsubq_no=0;
			q = Question.where(qtext: $~[:qtext].strip).first_or_create
			q.update_attributes(user_id: userid) if q.user_id = nil
			eq = Examquestion.create qnumber: q_no, subquestion_no: subq_no, qpaper_id: qpaper.id, mark: $~[:mark], question_id: q.id, user_id: userid
		when /^[Oo][Rr]$/
			puts "got Or"
		when /^\((?<subsubq>[ivx]+)\)\s+(?<qtext>.*)\s*\((?<mark>\d+)\)\s*$/
			subsubq_no+=1
			q = Question.where(qtext: $~[:qtext].strip).first_or_create
			q.update_attributes(user_id: userid) if q.user_id = nil
			eq = Examquestion.create qnumber: q_no, subquestion_no: subq_no, subsubqno: subsubq_no, qpaper_id: qpaper.id, mark: $~[:mark], question_id: q.id, user_id: userid	
		when /^!END_QPAPER!$/	
			qpaper = nil
		else
			puts line + "no match"
		end
	end
  end

  desc "adding courses"
  task :push_courses, [:course_sheet] => :environment do |t, args|
	sem=nil
	prac=false
	program=nil
	univ=nil
	elec=false
	degree=nil
	branches = { "CS" => "Computer Science and Engineering", "MA" => "Mathematics", "CY" => "Chemistry", "PH" => "Physics", "GE" => "General Engineering", "EE" => "Electrical and Electronics Engineering", "ME" => "Mechanical Engineering", "HS" => "Humanities", "MG" => "Management Studies", "GE" => "General Engineering", "IT" => "Information Technology", "EC" => "Electronics and Communication Engineering" }
	IO.foreach(args.course_sheet) do |line|
		case line
		when /^!Degree!(?<degree>.*)$/
			degree =  $~[:degree]
		when /^!University!(?<university>.*)$/
			univ = University.where(name: $~[:university]).first_or_create
		when /^!Branch!(?<branch>.*)$/
			branch = Branch.where(name: $~[:branch]).first_or_create
			branch.update_attributes stream: "Engineering"
			program=Program.where(degree_name: degree, university_id: univ.id, branch_id: branch.id).first_or_create
			puts program.attributes
		when /^!SEM!(?<sem>[0-9]+)$/
			sem=$~[:sem].to_i
		when /^!T!$/
			prac=false
		when /^!P!$/
			prac=true
		when /^!START_ELECTIVES!$/
			sem=nil
			elec=true
			prac=false
		when /^!END_ELECTIVES!$/
			elec=false		
		when /^!!(?<course_code>.*)\|(?<course_name>.*)\|(?<credits>[0-9]*)$/
			code = $~[:course_code]
			course_name = $~[:course_name]
			cred = $~[:credits].to_i
			course_branch_abbr = /(?<abbr>[[:alpha:]]+)\d+/.match(code)[:abbr]
			course_branch_name = branches.has_key?(course_branch_abbr) ? branches[course_branch_abbr] : course_branch_abbr
			course_branch = Branch.where(name: course_branch_name).first_or_create
			course_branch.update_attributes stream: "Engineering"
			course = Course.where(name: course_name, branch_id: course_branch.id, practical: prac).first_or_create
			puts course.attributes
			univ_course = UniversityCourse.where(course_id: course.id, university_id: univ.id, course_code: code).first_or_create
			puts univ_course.attributes			
			puc = ProgramUniversityCourse.where(university_course_id: univ_course.id, program_id: program.id, elective: elec, semester: sem, credits: cred).first_or_create
			puts puc.attributes
		else
		end
	end
  end
end
