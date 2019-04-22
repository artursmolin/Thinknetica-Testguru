class TestsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  
  def index
    @tests = Test.all.pluck('id, title')
    render inline: '<%= @tests %>'
  end

  def new
    @categories = Category.all
    @author = User.all
  end

  def create
    @test = Test.new(test_params)
    if @test.errors.empty?
      render inline: "New Test - Title: <%= @test.title %>, Category: <%= @test.category.title %>, Author: <%= @test.author.name %> has been created!"
      @test.save
    end
  end

  def show

  end

  private
  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found!'
  end
end
