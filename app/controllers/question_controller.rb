class QuestionController < ApplicationController
  def update
    return head :forbidden unless request.session.has_key? :active_organization
    question_id = params[:id]
    @question = Question.find(question_id)
    org_id = request.session[:active_organization]
    org = Organization.find(org_id)
    return head :failure unless params.has_key? :question
    @question.options.each do |option|
      Response.where(organization: org, option: option).destroy_all
    end
    if @question.q_type == 'text' then
      params[:question].each do |option_id, value|
        option = Option.find(option_id)
        Response.create!(organization: org, option: option, text_value: value)
      end
      return true
    end
    if @question.q_type == 'radio' then
      if params[:question].has_key? :radio then
        option = Option.find(params[:question][:radio])
        Response.create!(organization: org, option: option)
        return true
      end
    end
    if @question.q_type == 'select' then
      if params[:question].has_key? :select then
        option = Option.find(params[:question][:select])
        Response.create!(organization: org, option: option)
        return true
      end
    end
    return false
  end
end
