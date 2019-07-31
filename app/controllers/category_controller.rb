class CategoryController < ApplicationController
  def show
    @category = params[:category]
    @questions = Question.where(:category => @category)
    redirect_to '/' if @questions.empty?
    if @category == 'test-category' then
      request.session[:active_organization] = Organization.first
    end
    if lookup_context.exists?(@category, prefixes='category')
      return render @category, prefixes: 'category'
    end
  end
end
