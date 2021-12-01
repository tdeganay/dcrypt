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
    @dashboard = current_user.dashboard
    authorize @dashboard
    # @position = Position.find(params[:position_id])
    # @position.update(number: params[:new_number])
    positions = JSON.parse(request.body.read)
    positions.each do |position_data|
      Position.find(position_data["position"]).update(number: position_data["index"]) if position_data["position"]
    end
    render json: {done: true}
    # binding.pry
    # @dashboard.insert_at(params[:position].to_i)
    # head :ok
  end

end
