namespace :karpeer_admin do
  desc "adding question paper"
  task :push_qpapers, [:qpaper] => :environment do |t, args|
	q_no=0;
	subq_no=0;
	subsubq_no=0;
	univ=nil;
	qpaper=nil;
	userid = Admin.first.user_id
	current_course=true
	course_name=nil
	coursecode=nil
	course_branch=nil

	IO.foreach(args.qpaper) do |line|
		case line
		when /^!START_QPAPER_DESC!\s*$/
			univ=nil;
			current_course = true
			coursecode = nil
			course_name = nil
			course_branch=nil
			qpaper=Qpaper.new
		when /^!University!\s+(?<university>.*)$/
			puts $~[:university]
			univ=University.find_by! name: $~[:university].strip
			puts "No univ" if univ==nil
			puts univ
		when /^!Outdated!\s*$/
			current_course = false
		when /^!CourseName!\s+(?<coursename>.*)\s*$/
			course_name = $~[:coursename]
		when /^!Branch!\s+(?<branch>.*)\s*$/
			course_branch = Branch.find_by name: $~[:branch]
		when /^!CourseCode!\s+(?<coursecode>.*)\s*$/
			course = UniversityCourse.find_by university_id: univ.id, course_code: $~[:coursecode].strip
			if course == nil then
				course = UniversityCourse.create course_code: $~[:coursecode], university_id: univ.id, current: current_course , course_attributes: {name: course_name, branch_id: course_branch.id, practical: false }				
			end
			qpaper.university_course_id = course.id
		when /^!ExamName!\s+(?<exam_name>.*)\s*$/
			qpaper.exam_name = $~[:exam_name]
		when /^!Title!\s+(?<title>.*)\s*$/
			qpaper.title = $~[:title]
		when /^!Year!\s+(?<year>.*)\s*$/
			qpaper.year = $~[:year].to_i
		when /^!Month!\s+(?<month>.*)\s*$/
			qpaper.month = $~[:month]
		when /^!Semester!\s+(?<semester>.*)\s*$/
			qpaper.semester = $~[:semester]
		when /^!END_QPAPER_DESC!\s*$/
			qpaper.user_id = userid
			qpaper.save!
		when /^!START_QPAPER!\s*$/
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
		when /^(?<qno>[0-9]+)\.\s*$/
			q_no = $~[:qno]
			subq_no=0;
			subsubq_no=0;
		when /^\((?<subq>[a-zA-Z])\)\s*$/
			subq_no+=1;
			subsubq_no=0;
		when /^\((?<subq>[a-zA-Z])\)\s*(?<qtext>.*)\s*\((?<mark>\d+)\)\s*$/
			subq_no+=1;
			subsubq_no=0;
			q = Question.where(qtext: $~[:qtext].strip).first_or_create
			q.update_attributes(user_id: userid) if q.user_id = nil
			eq = Examquestion.create qnumber: q_no, subquestion_no: subq_no, qpaper_id: qpaper.id, mark: $~[:mark], question_id: q.id, user_id: userid
		when /^\s*\(*\s*[Oo][Rr]\s*\)*\s*$/
			puts "got Or"
		when /^\((?<subsubq>[ivx]+)\)\s+(?<qtext>.*)\s*\((?<mark>\d+)\)\s*$/
			subsubq_no+=1
			q = Question.where(qtext: $~[:qtext].strip).first_or_create
			q.update_attributes(user_id: userid) if q.user_id = nil
			eq = Examquestion.create qnumber: q_no, subquestion_no: subq_no, subsubqno: subsubq_no, qpaper_id: qpaper.id, mark: $~[:mark], question_id: q.id, user_id: userid	
		when /^!END_QPAPER!\s*$/	
			qpaper = nil
		else
			puts line + "no match"
		end
	end
  end


  desc "checking question paper"
  task :check_qpapers, [:qpaper] => :environment do |t, args|

	IO.foreach(args.qpaper) do |line|
		case line
		when /^!START_QPAPER_DESC!\s*$/
		when /^!University!\s+(?<university>.*)$/
		when /^!Outdated!\s*$/
		when /^!CourseName!\s+(?<coursename>.*)\s*$/
		when /^!Branch!\s+(?<branch>.*)\s*$/
		when /^!CourseCode!\s+(?<coursecode>.*)\s*$/
		when /^!ExamName!\s+(?<exam_name>.*)\s*$/
		when /^!Title!\s+(?<title>.*)\s*$/
		when /^!Year!\s+(?<year>.*)\s*$/
		when /^!Month!\s+(?<month>.*)\s*$/
		when /^!Semester!\s+(?<semester>.*)\s*$/
		when /^!END_QPAPER_DESC!\s*$/
		when /^!START_QPAPER!\s*$/			
		when /^(?<qno>[0-9]+)\.\s*(?<qtext>.*)\s*\((?<mark>\d+)\)\s*$/
		when /^(?<qno>[0-9]+)\.\s*$/
		when /^\((?<subq>[a-zA-Z])\)\s*$/
		when /^\((?<subq>[a-zA-Z])\)\s*(?<qtext>.*)\s*\((?<mark>\d+)\)\s*$/
		when /^\s*\(*\s*[Oo][Rr]\s*\)*\s*$/
		when /^\((?<subsubq>[ivx]+)\)\s+(?<qtext>.*)\s*\((?<mark>\d+)\)\s*$/
		when /^!END_QPAPER!\s*$/	
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
	branches = { "CS" => "Computer Science and Engineering", "MA" => "Mathematics", "CY" => "Chemistry", "PH" => "Physics", "GE" => "General Engineering", "EE" => "Electrical and Electronics Engineering", "ME" => "Mechanical Engineering", "HS" => "Humanities", "MG" => "Management Studies", "GE" => "General Engineering", "IT" => "Information Technology", "EC" => "Electronics and Communication Engineering", "CE" => "Chemical Engineering" }
	IO.foreach(args.course_sheet) do |line|
		case line
		when /^\s*!Degree!(?<degree>.*)\s*$/
			degree =  $~[:degree].strip
			puts degree
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
			existing_univ_course = UniversityCourse.find_by(university_id: univ.id, course_code: code)
			if existing_univ_course == nil then
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
				puc = ProgramUniversityCourse.where(university_course_id: existing_univ_course.id, program_id: program.id, elective: elec, semester: sem, credits: cred).first_or_create
			end
		else
			puts line + "no match"
		end
	end
  end

  desc "expire home"
  task :expire_home => :environment do |t|
	store = ActionController::Base.cache_store
	store.delete_matched(/home/)
  end


end
