class WelcomeController < ApplicationController
  def index
  end

  def register
    email = params[:new_user][:email]
    if Organization.exists?(email: email) then
      @email = email
      return render :recover
    end
    org = Organization.create!(email: email)
    session[:organization] = org
  end
end
