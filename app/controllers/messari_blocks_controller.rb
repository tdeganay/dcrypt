class MessariBlocksController < ApplicationController

  before_action :find_messari_block, only: [:show, :edit, :update, :destroy]

  def index
    @messari_blocks = MessariBlock.all
  end

  def new
    @messari_block = MessariBlock.new
    @dashboard = Dashboard.find(params[:dashboard_id])
    authorize @messari_block
  end

  def create

    @messari_block = MessariBlock.new(messari_block_params)
    @dashboard = Dashboard.find(params[:dashboard_id])

    authorize @messari_block
    if @messari_block.save
      @position = Position.new(dashboard: @dashboard, block: @messari_block, number: params.dig(:twitter_block, :position))
      @position.save
      redirect_to dashboard_path(@dashboard)

    else
      render :new
    end
  end

  def show
    authorize @messari_block
    @response = MessariApi.new(@messari_block).create_entries
    respond_to do |format|
      format.html
      format.json
    end
  end

  # def edit
  # end

  # def update
  # end

  # def destroy

  # end

  private

  def messari_block_params
    params.require(:messari_block).permit(:user_string)
  end

  def find_messari_block
    @messari_block = MessariBlock.find(params[:id])
  end
end