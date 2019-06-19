class PagesController < ApplicationController
  def dashboard
    @user = current_user
  end

  def chef_page
    @user = current_user
  end
end
