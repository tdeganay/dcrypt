class DashboardsController < ApplicationController

  def show
    @dashboard = Dashboard.find(params[:id])
    authorize @dashboard
    # remove comment to fetch tweet and save them in Tweets database
    # @response = FetchAndSaveTweets.new(TwitterBlock.first).call
  end

  def update?
    record.user == user
  end

  # def index
  #   @dashboards = policy_scope(dashboard).order(created_at: :desc)
  # end

  # def destroy?
  #   record.user == user
  # end

  def move
    # binding.pry
    # @dashboard.insert_at(params[:position].to_i)
    # head :ok
  end

end
