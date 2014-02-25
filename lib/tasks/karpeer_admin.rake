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
	ucourse=nil

	IO.foreach(args.qpaper) do |line|
		case line
		when /^\s*!START_QPAPER_DESC!\s*$/
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
		when /^!Outdated!\s*$/
			current_course = false
		when /^!CourseName!\s+(?<coursename>.*)\s*$/
			course_name = $~[:coursename]
		when /^!Branch!\s+(?<branch>.*)\s*$/
			course_branch = Branch.find_by name: $~[:branch]
		when /^!CourseCode!\s+(?<coursecode>.*)\s*$/
			ucourse = UniversityCourse.find_by university_id: univ.id, course_code: $~[:coursecode].strip
			if ucourse == nil then
				ucourse = UniversityCourse.create! course_code: $~[:coursecode], university_id: univ.id, current: current_course , course_attributes: {name: course_name, branch_id: course_branch.id, practical: false }				
			end
			qpaper.university_course_id = ucourse.id
		when /^!ExamName!\s+(?<exam_name>.*)\s*$/
			qpaper.exam_name = $~[:exam_name]
		when /^!Title!\s+(?<title>.*)\s*$/
			qpaper.title = $~[:title]
		when /^!Year!\s+(?<year>.*)\s*$/
			qpaper.year = $~[:year].to_i
		when /^!Month!\s+(?<month>.*)\s*$/
			qpaper.month = $~[:month]
		when /^!Semester!\s+(?<semester>.*)\s*$/
			#qpaper.semester = $~[:semester]
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
			q = Question.where(qtext: $~[:qtext].strip).first_or_initialize
			q.user_id ||= userid
			q.course_id ||= ucourse.course_id
			q.save!			
			eq = Examquestion.create qnumber: q_no, qpaper_id: qpaper.id, mark: $~[:mark], question_id: q.id, user_id: userid
		when /^(?<qno>[0-9]+)\.\s*$/
			q_no = $~[:qno]
			subq_no=0;
			subsubq_no=0;
		when /^\((?<subq>[a-hA-H])\)\s*$/
			subq_no+=1;
			subsubq_no=0;
		when /^\((?<subq>[a-hA-H])\)\s*(?<qtext>.*)\s*\((?<mark>\d+)\)\s*$/
			subq_no+=1;
			subsubq_no=0;
			q = Question.where(qtext: $~[:qtext].strip).first_or_initialize
			q.user_id ||= userid
			q.course_id ||= ucourse.course_id
			q.save!
			eq = Examquestion.create qnumber: q_no, subquestion_no: subq_no, qpaper_id: qpaper.id, mark: $~[:mark], question_id: q.id, user_id: userid
		when /^\s*\(*\s*[Oo][Rr]\s*\)*\s*$/
			puts "got Or"
		when /^\((?<subsubq>[ivx]+)\)\s*(?<qtext>.*)\s*\((?<mark>\d+)\)\s*$/
			subsubq_no+=1
			q = Question.where(qtext: $~[:qtext].strip).first_or_initialize
			q.user_id ||= userid
			q.course_id ||= ucourse.course_id
			q.save!
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
	ucourse=nil
	IO.foreach(args.qpaper) do |line|
		case line
		when /^\s*!START_QPAPER_DESC!\s*$/
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
			q_no=0;
			subq_no=0;
			subsubq_no=0;			
		when /^(?<qno>[0-9]+)\.\s*(?<qtext>.*)\s*\((?<mark>\d+)\)\s*$/
			q_no = $~[:qno]
			subq_no=0;
			subsubq_no=0;
		when /^(?<qno>[0-9]+)\.\s*$/
			q_no = $~[:qno]
			subq_no=0;
			subsubq_no=0;
		when /^\((?<subq>[a-hA-H])\)\s*$/
			subq_no+=1;
			subsubq_no=0;
		when /^\((?<subq>[a-hA-H])\)\s*(?<qtext>.*)\s*\((?<mark>\d+)\)\s*$/
			subq_no+=1;
			subsubq_no=0;
		when /^\s*\(*\s*[Oo][Rr]\s*\)*\s*$/
		when /^\((?<subsubq>[ivx]+)\)\s*(?<qtext>.*)\s*\((?<mark>\d+)\)\s*$/
			subsubq_no+=1
		when /^!END_QPAPER!\s*$/	
		else
			puts line
			puts "No match"
		end
		#puts "( "+q_no.to_s+"."+subq_no.to_s+"."+subsubq_no.to_s+" )"+line
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
	branches = { "CS" => "Computer Science and Engineering", "MA" => "Mathematics", "CY" => "Chemistry", "PH" => "Physics", "GE" => "General Engineering", "EE" => "Electrical and Electronics Engineering", "ME" => "Mechanical Engineering", "HS" => "Humanities", "MG" => "Management Studies", "GE" => "General Engineering", "IT" => "Information Technology", "EC" => "Electronics and Communication Engineering", "CE" => "Civil Engineering" }
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
				course_name = $~[:course_name].strip
				cred = $~[:credits].to_i
				course_branch_abbr = /(?<abbr>[[:alpha:]]+)\s*\d+/.match(code)[:abbr]
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
		when /^!E(?<elective_no>[0-9]+)!(?<course_code>.*)\|(?<course_name>.*)\|(?<credits>[0-9]*)$/
			code = $~[:course_code]
			elec_no = $~[:elective_no]
			existing_univ_course = UniversityCourse.find_by(university_id: univ.id, course_code: code)
			if existing_univ_course == nil then
				course_name = $~[:course_name].strip
				cred = $~[:credits].to_i
				course_branch_abbr = /(?<abbr>[[:alpha:]]+)\d+/.match(code)[:abbr]
				course_branch_name = branches.has_key?(course_branch_abbr) ? branches[course_branch_abbr] : course_branch_abbr
				course_branch = Branch.where(name: course_branch_name).first_or_create
				course_branch.update_attributes stream: "Engineering"
				course = Course.where(name: course_name, branch_id: course_branch.id, practical: prac).first_or_create
				puts course.attributes
				univ_course = UniversityCourse.where(course_id: course.id, university_id: univ.id, course_code: code).first_or_create
				puts univ_course.attributes			
				puc = ProgramUniversityCourse.where(university_course_id: univ_course.id, program_id: program.id, elective: true, semester: sem, elective_no: elec_no.to_i, credits: cred).first_or_create
				puts puc.attributes
			else
				puc = ProgramUniversityCourse.where(university_course_id: existing_univ_course.id, program_id: program.id, elective: true, semester: sem, elective_no: elec_no.to_i, credits: cred).first_or_create
			end

		when /!E(?<elective_no>\d)!(?<course_abbr>\D{2})\s*(?<code>\d{4})\s*(?<course_name>.*)\s*(\d{1}\s*){3}(?<credits>\d)/
			puts "Inside elective"	
			course_abbr=$~[:course_abbr].strip
			code=course_abbr+$~[:code].strip
			elec_no = $~[:elective_no]
			existing_univ_course = UniversityCourse.find_by(university_id: univ.id, course_code: code)
			if existing_univ_course == nil then
				course_name = $~[:course_name].strip
				cred = $~[:credits].to_i
				course_branch_abbr = /(?<abbr>[[:alpha:]]+)\d+/.match(code)[:abbr]
				course_branch_name = branches.has_key?(course_abbr) ? branches[course_abbr] : course_abbr
				course_branch = Branch.where(name: course_branch_name).first_or_create
				course_branch.update_attributes stream: "Engineering"
				course = Course.where(name: course_name, branch_id: course_branch.id, practical: prac).first_or_create
				#puts course.attributes
				univ_course = UniversityCourse.where(course_id: course.id, university_id: univ.id, course_code: code).first_or_create
				#puts univ_course.attributes			
				puc = ProgramUniversityCourse.where(university_course_id: univ_course.id, program_id: program.id, elective: true, semester: sem, elective_no: elec_no.to_i, credits: cred).first_or_create
				puts puc.attributes
			else
				puc = ProgramUniversityCourse.where(university_course_id: existing_univ_course.id, program_id: program.id, elective: true, semester: sem, elective_no: elec_no.to_i, credits: cred).first_or_create
			end

		when /(?<course_abbr>\D{2})\s*(?<code>\d{4})\s*(?<course_name>.*)\s*(\d{1}\s*){3}(?<credits>\d)/
			puts "Inside normal"	
			course_abbr=$~[:course_abbr].strip
			code=course_abbr+$~[:code].strip
			if existing_univ_course == nil then
				course_name = $~[:course_name].strip
				cred = $~[:credits].to_i
				course_branch_name = branches.has_key?(course_abbr) ? branches[course_abbr] : course_abbr
				course_branch = Branch.where(name: course_branch_name).first_or_create
				course_branch.update_attributes stream: "Engineering"
				course = Course.where(name: course_name, branch_id: course_branch.id, practical: prac).first_or_create
				#puts course.attributes
				univ_course = UniversityCourse.where(course_id: course.id, university_id: univ.id, course_code: code).first_or_create
				#puts univ_course.attributes			
				puc = ProgramUniversityCourse.where(university_course_id: univ_course.id, program_id: program.id, elective: elec, semester: sem,  credits: cred).first_or_create
				puts puc.attributes
			else
				puc = ProgramUniversityCourse.where(university_course_id: existing_univ_course.id, program_id: program.id, elective: elec, semester: sem,  credits: cred).first_or_create
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
	  store.delete_matched(/index/)
  end

  desc "checking schedule"
    task :check_schedule, [:timetable] => :environment do |t, args|
    university=University.find_by_name("Anna University - Affliated Colleges")
    IO.foreach(args.timetable) do |line|
		  case line
		    when /^.*(?<coursecode>[A-Z]{2}\d{4})\s+(?<date>\d{2}-[A-Z]{3}-\d{2}).*\s+(?<session>(FN|AN))\s*$/
           coursecode=$~[:coursecode]
           uc=UniversityCourse.find_by(university_id: university.id, course_code: coursecode)
           if uc.nil? then
           puts line
           puts coursecode
           puts "No course found" 
           else
            puts uc
           end
      end  
    end
  end

  desc "adding schedule"
    task :add_schedule, [:timetable] => :environment do |t, args|
    university=University.find_by_name("Anna University - Affliated Colleges")
    IO.foreach(args.timetable) do |line|
      puts line
		  case line
		    when /^.*(?<coursecode>[A-Z]{2}\d{4})\s+(?<date>\d{2}-[A-Z]{3}-\d{2}).*\s+(?<session>(FN|AN))\s*$/
           coursecode=$~[:coursecode]
           examdate=Date.parse($~[:date])
           uc=UniversityCourse.find_by(university_id: university.id, course_code: coursecode)
           
           exam=Exam.find_by(university_course_id: uc.id, date: examdate) || Exam.create(university_course_id: uc.id, date: examdate, session: $~[:session])
           puts exam.attributes
      end  
    end
  end

  desc "adding units and books"
    task :add_units, [:units] => :environment do |t, args|
    university=University.find_by_name("Anna University - Affliated Colleges")
    uc=nil
    unit=nil
    start_curriculum=false
    start_books=false
    line_after_unit=false
    references=false
    units=[]
    romans=["i","ii","iii","iv","v","vi","vii","viii","ix","x","xi","xii","xiii","xiv","xv","xvi","xvii","xviii","xix","xx"]
    IO.foreach(args.units) do |line|
      puts line
      ignore=false
		  case line
		    when /^\s*(?<courseabbr>[A-Z]{2}) *(?<code>\d{4})\s*$/
           coursecode=$~[:courseabbr]+$~[:code]
           uc=UniversityCourse.find_by(university_id: university.id, course_code: coursecode)
           if uc.units.count > 0 then
             ignore=true
           end
           start_curriculum=false
           start_books=false
           line_after_unit=false
        when /^UNIT (?<unitno>[IVX]+)\s*(?<name>.*)\s*$/
           name=$~[:name]
           u=Unit.new unit_number: romans.index($~[:unitno].downcase)+1, university_course_id: uc.id, unit_curriculum: nil
           u.name=name unless name.blank?
           puts u.attributes
           units.append(u)
           start_curriculum=true
           line_after_unit=true
        when /^\d+$/
           units.last.unit_curriculum+=(" "+line.strip) unless(line_after_unit || !start_curriculum || units.empty? || units.last.unit_curriculum.nil? )
           line_after_unit=false

        when /^TOTAL *[:=] *\d+ PERIODS$/
           start_curriculum=false
           units.each{ |u| u.save } unless ignore
           units=[]
           line_after_unit=false
        when /^TEXT *BOOKS*:*$/
           start_books=true
           references=false
        when /^REFERENCES*[:]*$/
           start_books=true
           references=true
        when /^\d+\.\s*(?<bookname>.+)\|ASIN(?<asin>\d+)$/
           puts "adding books"
           asin=$~[:asin]
           if start_books then
             Textbook.create(name: $~[:bookname], university_course_id: uc.id, reference: references, amzasin: asin) unless ignore
           else
             if start_curriculum then
              if units.last.unit_curriculum==nil then
                units.last.unit_curriculum=line.strip
              else
                units.last.unit_curriculum+=(" "+line.strip)
              end
             end
           end
        when /^\d+\.\s*(?<bookname>.+)\|<iframe src="http:\/\/www.flipkart.com\/affiliate\/displayWidget\?affrid=(?<affrid>.*)" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" ><\/iframe>$/
           puts "adding books"
           affrid=$~[:affrid]
           if start_books then
             Textbook.create(name: $~[:bookname], university_course_id: uc.id, reference: references, flipkart_affrid: affrid) unless ignore
           else
             if start_curriculum then
              if units.last.unit_curriculum==nil then
                units.last.unit_curriculum=line.strip
              else
                units.last.unit_curriculum+=(" "+line.strip)
              end
             end
           end
        when /^\d+\.\s*(?<bookname>.+)\|<iframe src="http:\/\/www.flipkart.com\/affiliate\/displayWidget\?affrid=(?<affrid>.*)" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" ><\/iframe>\|(?<asin>\d+)$/
           puts "adding books"
           affrid=$~[:affrid]
           asin=$~[:asin]
           if start_books then
             Textbook.create(name: $~[:bookname], university_course_id: uc.id, reference: references, flipkart_affrid: affrid, amzasin: asin) unless ignore
           else
             if start_curriculum then
              if units.last.unit_curriculum==nil then
                units.last.unit_curriculum=line.strip
              else
                units.last.unit_curriculum+=(" "+line.strip)
              end
             end
           end
        when /^\d+\.\s*(?<bookname>.+)\|na$/
           if start_books then
             Textbook.create(name: $~[:bookname], university_course_id: uc.id, reference: references, flipkart_affrid: nil) unless ignore
           else
             if start_curriculum then
              if units.last.unit_curriculum==nil then
                units.last.unit_curriculum=line.strip
              else
                units.last.unit_curriculum+=(" "+line.strip)
              end
             end
           end           
        else
           if start_curriculum then
            if units.last.unit_curriculum==nil then
              units.last.unit_curriculum=line.strip
            else
              units.last.unit_curriculum+=(" "+line.strip)
            end
           end
           line_after_unit=false
      end  
    end
  end


  desc "adding solutions"
    task :add_answers, [:answers] => :environment do |t, args|
    IO.foreach(args.answers) do |line|
      puts line
      sol=Solution.new
		  case line
        when /^###\s*$/
          sol.save unless sol.answer.blank?
        when /^http:\/\/karpeer\.com\/questions\/(?<qno>\d+)\?qpaper=\d+\s*/
          question=Question.find($~[:qno].to_i)
          puts question.id
          sol=Solution.create question_id: question.id, answer: "", user_id: Admin.first.user_id
          puts sol
        else
          puts sol
          sol.answer=sol.answer+line+"\n"
        end	
    end
  end
end
