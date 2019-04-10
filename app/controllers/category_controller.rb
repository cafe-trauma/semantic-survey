class CategoryController < ApplicationController
  def show
    @category = params[:category]
    @questions = Question.where(:category => @category)
  end
end
