class BlocksController < ApplicationController
skip_after_action :verify_authorized

  def choose_block
    @dashboard = current_user.dashboard
  end

end
