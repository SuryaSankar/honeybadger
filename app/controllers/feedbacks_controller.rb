class FeedbacksController < ApplicationController
  def new
	@feedback=Feedback.new
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    
    if @feedback.valid?
      FeedbackMailer.new_feedback(@feedback).deliver
      #redirect_to(root_path, :notice => "feedback was successfully sent.")
      render text: "Your feedback was delivered"
    else
      flash.now.alert = "Please fill all fields."
      render :new
    end
  end

private
  def feedback_params
	params.require(:feedback).permit(:name, :email, :subject, :body)
  end
end
