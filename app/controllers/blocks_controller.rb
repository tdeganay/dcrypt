class BlocksController < ApplicationController
skip_after_action :verify_authorized

  def choose_block
    @dashboard = current_user.dashboard
    @position = params[:number]
    respond_to do |format|
      format.html
      format.json
    end
  end

end
