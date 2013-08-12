module ExamquestionsHelper

	def build_examquestion(qp)
		eq=qp.examquestions.build
		eq.build_question
		return eq
	end
	def build_eq_with_question(eq)
	eq.question=Question.new
	return eq
	end
end
