class FeedbackMailer < ActionMailer::Base

  default :from => "karpeer.com@gmail.com"
  default :to => "karpeer.com@gmail.com"

  def new_feedback(feedback)
    @feedback = feedback
    mail(:subject => "Feedback: #{feedback.subject}")
  end

end
