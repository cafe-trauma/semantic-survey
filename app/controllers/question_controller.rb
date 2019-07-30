class QuestionController < ApplicationController
  def show
    question_id = params[:id]
    @question = Question.find(question_id)
  end

  def update
    return head :forbidden unless request.session.has_key? :active_organization
    question_id = params[:id]
    @question = Question.find(question_id)
  end
end
