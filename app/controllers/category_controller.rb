class CategoryController < ApplicationController
  def show
    @category = params[:category]
    @questions = Question.where(:category => @category)
    redirect_to '/' if @questions.empty?
    if lookup_context.exists?(@category, prefixes='category')
      return render @category, prefixes: 'category'
    end
  end
end
