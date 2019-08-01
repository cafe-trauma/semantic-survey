class QuestionController < ApplicationController
  def update
    return head :forbidden unless request.session.has_key? :active_organization
    question_id = params[:id]
    @question = Question.find(question_id)
    puts params[:question]
  end
end
