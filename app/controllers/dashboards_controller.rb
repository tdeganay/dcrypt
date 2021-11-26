class DashboardsController < ApplicationController

  def show
    @dashboard = Dashboard.find(params[:id])
    authorize @dashboard
    # remove comment to fetch tweet and save them in Tweets database
    # @response = FetchAndSaveTweets.new(TwitterBlock.first).call
    @tweets = Tweet.last(2)
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


end
