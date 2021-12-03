class KeyFiguresBlocksController < ApplicationController

  before_action :find_key_figures_block, only: [:show, :edit, :update, :destroy]

  def index
    @key_figures_blocks = KeyFiguresBlock.all
  end

  def new
    @key_figures_block = KeyFiguresBlock.new
    @dashboard = Dashboard.find(params[:dashboard_id])
    authorize @key_figures_block
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @key_figures_block = KeyFiguresBlock.new(key_figures_block_params)
    @dashboard = Dashboard.find(params[:dashboard_id])

    authorize @key_figures_block
    if @key_figures_block.save
      @position = Position.new(dashboard: @dashboard, block: @key_figures_block, number: params.dig(:key_figures_block, :position))
      @position.save
      update = KeyFiguresApi.new(@key_figures_block).update_block
        redirect_to dashboard_path(@dashboard)
    else
      render :new
    end
  end

  def show
    authorize @key_figures_block
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

  def key_figures_block_params
    params.require(:key_figures_block).permit(:user_string)
  end

  def find_key_figures_block
    @key_figures_block = KeyFiguresBlock.find(params[:id])
  end

end
