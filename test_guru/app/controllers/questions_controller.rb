class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_test
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found

  def index
    @questions = @test.questions
    render json: @questions
  end

  def show
    @question_showed = Question.find(params[:id])
    render json: @question_showed
  end

  def new

  end

  def create
    @question = @test.questions.create!(question_params)
    if @question.errors.empty?
      redirect_to @test
    else
      render render plain: "New question has been created!"
    end
  end

  def destroy
    @question = @test.questions.destroy
    render plain: "Test has been destroyed!"
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
