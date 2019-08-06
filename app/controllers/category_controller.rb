class CategoryController < ApplicationController
  def show
    @category = params[:category]
    @questions = Question.where(category: @category)
    return redirect_to "/" if @questions.empty?
    if @category == "test-category"
      @org = Organization.first
      request.session[:active_organization] = @org.id
    end
    if lookup_context.exists?("category/#{@category}")
      return render @category, prefixes: "category"
    end
    redirect_to "/"
  end
end
