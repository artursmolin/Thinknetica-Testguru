class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:destroy, :show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found

  def index
    @questions = @test.questions
    render json: @questions
  end

  def show
    render inline: "ID: <%= @question.id %>, Question: <%= @question.body %>, Test_ID: <%= @question.test_id %>"
  end

  def new; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render inline: "New question - ID: <%= @question.id %>, Question: <%= @question.body %>, Test_ID: <%= @question.test_id %> has been created!"
    else render plain: "Something going wrong!"
    end
  end

  def destroy
    @question.destroy
    render inline: "Question - ID: <%= @question.id %>, Question: <%= @question.body %>, Test_ID: <%= @question.test_id %> has been deleted!"
  end


  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_record_not_found
    head :not_found
    render plain: "Record not found!"
  end
end
