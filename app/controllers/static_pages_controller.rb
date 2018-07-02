class StaticPagesController < ApplicationController
  def home
    @chore = current_user.chores.build if logged_in?
  end

  def about
  end

  def contact
  end
end
