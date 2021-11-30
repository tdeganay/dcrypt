class PositionsController < ApplicationController

  def destroy
    @position = Position.find(params[:id])
    @dashboard = @position.dashboard
    authorize @position
    @position.block.destroy
    @position.destroy
    redirect_to dashboard_path(@dashboard)
  end

end
