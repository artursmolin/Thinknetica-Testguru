class QuestionsController < ApplicationController

  def index
    @tests = Test.find(params[:test_id])
    @questions = @tests.questions
    render json: @questions
  end

  def show
    @question= Question.find(params[:id])
    render json: @question
  end


  private
  def semester_params
    params.require(:question).permit(:body, :test_id)
  end

end
