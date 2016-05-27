class PagesController < ApplicationController
  def home
    if logged_in?
      redirect_to notes_path
    end
  end
end
