class DashboardsController < ApplicationController

  def show
    @dashboard = Dashboard.find(params[:id])
    authorize @dashboard
    twitter
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



  private

  def twitter
    # client = Twitter::REST::Client.new do |config|
    #   config.consumer_key        = "Il7X9GFJG9qukqZHE5nJ5O7ek"
    #   config.consumer_secret     = "hOgZewTH2p7eiQzopDdA8gojQuHP9SPO6askqEZ6YiDDVVE02R"
    #   config.access_token        = "47867559-CYBcmAPa5TSwgQDcjAG5QdZVExvLhrlur3c6JJjCy"
    #   config.access_token_secret = "Ox4Icc4wY28C4xHjWdvWvOJTJp0fHGOT27vX3gisAHkZi"
    # end

    # This script uses your bearer token to authenticate and make a Search request

    # The code below sets the bearer token from your environment variables
    # To set environment variables on Mac OS X, run the export command below from the terminal:
    # export BEARER_TOKEN='YOUR-TOKEN'
    bearer_token = ENV['TWITTER_BEARER_TOKEN']

    p bearer_token
    # Endpoint URL for the Recent Search API
    search_url = "https://api.twitter.com/2/tweets/search/recent"

    # Set the query value here. Value can be up to 512 characters
    query = "from:Twitter OR from:TwitterDev OR from:DailyNasa"

    # Add or remove parameters below to adjust the query and response fields within the payload
    # See docs for list of param options: https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-recent
    query_params = {
      "query": query, # Required
      "max_results": 10,
      # "start_time": "2020-07-01T00:00:00Z",
      # "end_time": "2020-07-02T18:00:00Z",
      # "expansions": "attachments.poll_ids,attachments.media_keys,author_id",
      "tweet.fields": "attachments,author_id,conversation_id,created_at,entities,id,lang",
      "user.fields": "description"
      # "media.fields": "url",
      # "place.fields": "country_code",
      # "poll.fields": "options"
    }

    response = search_tweets(search_url, bearer_token, query_params)
    puts response.code, JSON.pretty_generate(JSON.parse(response.body))

  end

  def search_tweets(url, bearer_token, query_params)
    options = {
      method: 'get',
      headers: {
        "User-Agent": "v2RecentSearchRuby",
        "Authorization": "Bearer #{bearer_token}"
      },
      params: query_params
    }

    request = Typhoeus::Request.new(url, options)
    response = request.run

    return response
  end
end
