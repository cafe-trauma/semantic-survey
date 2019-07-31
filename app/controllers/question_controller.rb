class QuestionController < ApplicationController
  def show
    question_id = params[:id]
    @question = Question.find(question_id)
    if request.session.has_key? :active_organization then
      org = request.session[:active_organization]
      @responses = Response.find_by(question: @question, organization: org)
    end
  end

  def update
    return head :forbidden unless request.session.has_key? :active_organization
    question_id = params[:id]
    @question = Question.find(question_id)
  end
end
