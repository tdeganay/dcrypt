class TwitterBlocksController < ApplicationController
  before_action :find_twitter_block, only: [:show, :edit, :update, :destroy]

  def index
    @twitter_blocks = TwitterBlock.all
  end

  def new
    @twitter_block = TwitterBlock.new
    @dashboard = Dashboard.find(params[:dashboard_id])
    authorize @twitter_block
  end

  def create

    @twitter_block = TwitterBlock.new(twitter_block_params)
    @dashboard = Dashboard.find(params[:dashboard_id])


    authorize @twitter_block
    if @twitter_block.save
      @position = Position.new(dashboard: @dashboard, block: @twitter_block)
      @position.save
      redirect_to dashboard_path(@dashboard)
    else
      render :new
    end
  end

  def show
    authorize @twitter_block
    @response = FetchAndSaveTweets.new(@twitter_block).call
    respond_to do |format|
      format.html # Follow the flow
      format.json # Follow the classic Rails flow and look for a show.json view
    end
  end

  def edit
  end

  def update
  end

  def destroy
    raise
  end

  private

  def twitter_block_params
    params.require(:twitter_block).permit(:user_string)
  end

  def find_twitter_block
    @twitter_block = TwitterBlock.find(params[:id])
  end
end
