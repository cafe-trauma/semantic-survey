class QuestionController < ApplicationController
  def update
    return head :forbidden unless request.session.has_key? :active_organization
    question_id = params[:id]
    @question = Question.find(question_id)
    org_id = request.session[:active_organization]
    org = Organization.find(org_id)
    return head :failure unless params.has_key? :question
    params[:question].each do |option_id, value|
      option = Option.find(option_id)
      Response.create!(organization: org, option: option, text_value: value)
    end
  end
end
