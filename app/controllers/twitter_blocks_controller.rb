class TwitterBlocksController < ApplicationController
  before_action :find_twitter_block, only: [:show, :edit, :update, :destroy]

  def index
    @twitter_blocks = TwitterBlock.all
  end

  def new
    @twitter_block = TwitterBlock.new
  end

  def create
    authorize @dashboard
    @twitter_block = TwitterBlock.new(twitter_block_params)
    @user = @dashboard.user
    if @twitter_block.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    authorize @twitter_block
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def twitter_block_params
    params.require(:twitter_block).permit(dashboard_id)
  end

  def find_twitter_block
    @twitter_block = TwitterBlock.find(params[:id])
  end
end
