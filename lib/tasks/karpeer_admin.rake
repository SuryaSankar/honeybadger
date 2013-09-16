namespace :karpeer_admin do
  desc "adding question paper"
  task :push_qpapers, [:qpaper] => :environment do |t, args|
	q_no=0;
	subq_no=0;
	subsubq_no=0;
	univ=nil;
	qpaper=nil;

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
			eq = Examquestion.create qnumber: q_no, qpaper_id: qpaper.id, mark: $~[:mark], question_id: q.id
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
			eq = Examquestion.create qnumber: q_no, subquestion_no: subq_no, qpaper_id: qpaper.id, mark: $~[:mark], question_id: q.id
		when /^[Oo][Rr]$/
			puts "got Or"
		when /^\((?<subsubq>[ivx]+)\)\s+(?<qtext>.*)\s*\((?<mark>\d+)\)\s*$/
			subsubq_no+=1
			q = Question.where(qtext: $~[:qtext].strip).first_or_create
			eq = Examquestion.create qnumber: q_no, subquestion_no: subq_no, subsubqno: subsubq_no, qpaper_id: qpaper.id, mark: $~[:mark], question_id: q.id	
		when /^!END_QPAPER!$/	
			qpaper = nil
		else
			puts line + "no match"
		end
	end
  end
end
