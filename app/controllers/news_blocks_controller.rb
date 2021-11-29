class NewsBlocksController < ApplicationController
  def index
    @news_blocks = News_Block.all
  end

  def show
    authorize @news_block
    @response = NewsApi.new(@news_block).call
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @news_block = News_Block.new
    @dashboard = Dashboard.find(params[:dashboard_id])
    authorize @news_block
  end

  def create
    @news_block = News_Block.new(news_block_params)
    @dashboard = Dashboard.find(params[:dashboard_id])

    authorize @news_block
    if @news_block.save
      @position = Position.new(dashboard: @dashboard, block: @news_block)
      @position.save
      redirect_to dashboard_path(@dashboard)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def news_block_params
    params.require(:news_block).permit(:user_string)
  end

  def find_news_block
    @news_block = News_Block.find(params[:id])
  end
end
