class CategoryController < ApplicationController
  def show
    @category = params[:category]
    @questions = Question.where(category: @category)
    return redirect_to "/" if @questions.empty?
    if request.session.key?(:active_organization)
      org_id = request.session[:active_organization]
      @org = Organization.find(org_id)
    end
    if lookup_context.exists?("category/#{@category}")
      return render @category, prefixes: "category"
    end
    redirect_to "/"
  end
end
