class QuestionController < ApplicationController
  def update
    return head :forbidden unless request.session.key? :active_organization
    question_id = params[:id]
    @question = Question.find(question_id)
    org_id = request.session[:active_organization]
    org = Organization.find(org_id)
    return head :failure unless params.key? :question
    @question.options.each do |option|
      Response.where(organization: org, option: option).destroy_all
    end
    if @question.q_type == "text"
      params[:question].each do |option_id, value|
        option = Option.find(option_id)
        Response.create!(organization: org, option: option, text_value: value)
      end
      return true
    end
    if @question.q_type == "checkbox"
      puts "Hit a checkbox"
      params[:question].each do |option_id, text|
        option = Option.find(option_id)
        Response.create!(organization: org, option: option) if option.text == text
      end
      return true
    end
    if @question.q_type == "radio"
      if params[:question].key? :radio
        option = Option.find(params[:question][:radio])
        Response.create!(organization: org, option: option)
        return true
      end
    end
    if @question.q_type == "select"
      if params[:question].key? :select
        option = Option.find(params[:question][:select])
        Response.create!(organization: org, option: option)
        return true
      end
    end
    false
  end
end
