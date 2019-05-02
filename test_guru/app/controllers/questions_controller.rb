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

  def new
    @test = Test.find(params[:test_id])
    @question = @test.questions.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(test.test_id)
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to tests_path
    else
      render :edit
    end
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
