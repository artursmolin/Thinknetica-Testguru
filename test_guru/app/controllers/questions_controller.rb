class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found

  def index
    @questions = @test.questions
    render json: @questions
  end

  def show
    @question = Question.find(params[:id])
    render inline: "ID: <%= @question.id %>, Question: <%= @question.body %>, Test_ID: <%= @question.test_id %>"
  end

  def new; end

  def create
    @question = @test.questions.new(question_params)
    if @question.errors.empty?
      @question.save
      render inline: "New question - ID: <%= @question.id %>, Question: <%= @question.body %>, Test_ID: <%= @question.test_id %> has been created!"
    end
  end

  def destroy
    question = Question.find(params[:id]).destroy
    render inline: "New question - ID: <%= @question.id %>, Question: <%= @question.body %>, Test_ID: <%= @question.test_id %> has been deleted!"
  end


  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_record_not_found
    head :not_found
    render plain: "Record not found!"
  end
end
