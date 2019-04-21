class TestsController < ApplicationController
  def index
    render plain: "All html"
  end

  def new
    @categories = Category.all
    @author = User.all
  end

  def create
    @test = Test.create!(test_params)
    if @test.errors.empty?
      redirect_to @test
    else
      render 'new'
    end
  end

  def show
    render plain: "New test has been created!"
  end

  private
  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
