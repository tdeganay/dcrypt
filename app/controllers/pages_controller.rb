class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @dashboard = Dashboard.create!(user_id: current_user.id)
  end

end
