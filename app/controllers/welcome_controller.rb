class WelcomeController < ApplicationController
  def index
  end

  def register
    puts params[:new_user].inspect
  end
end
