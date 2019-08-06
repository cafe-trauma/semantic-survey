class WelcomeController < ApplicationController
  def index
  end

  def register
    email = params[:new_user][:email]
    if Organization.exists?(email: email)
      @email = email
      return render :recover
    end
    org = Organization.create!(email: email)
    session[:active_organization] = org.id
    render :register
  end
end
