module ExamquestionsHelper

	def build_examquestion(qp)
		eq=qp.examquestions.build
		eq.build_question
		return eq
	end
end
