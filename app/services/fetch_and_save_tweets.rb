class FetchAndSaveTweets

  def initialize(twitter_block)
    @twitter_block = twitter_block
  end

  def call
    # This script uses your bearer token to authenticate and make a Search request

    # The code below sets the bearer token from your environment variables
    # To set environment variables on Mac OS X, run the export command below from the terminal:
    # export BEARER_TOKEN='YOUR-TOKEN'
    bearer_token = ENV["TWITTER_BEARER_TOKEN"]

    # Endpoint URL for the Recent Search API
    search_url = "https://api.twitter.com/2/tweets/search/recent"


    # Set the query value here. Value can be up to 512 characters
    query = @twitter_block.user_string

    # Add or remove parameters below to adjust the query and response fields within the payload
    # See docs for list of param options: https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-recent
    query_params = {
      "query": query, # Required
      "max_results": 10,
      # "start_time": "2020-07-01T00:00:00Z",
      # "end_time": "2020-07-02T18:00:00Z",
      "expansions": "author_id,referenced_tweets.id",
      "tweet.fields": "attachments,author_id,conversation_id,created_at,entities,id,lang",
      "user.fields": "description,name,username,profile_image_url",
      "media.fields": "url"
      # "place.fields": "country_code",
      # "poll.fields": "options"
    }

    @response = JSON.parse(search_tweets(search_url, bearer_token, query_params).body)
    store_tweets
    @response

    # @response = JSON.parse(search_tweets(search_url, bearer_token, query_params).body)
    # puts @response.code, JSON.pretty_generate(JSON.parse(@response.body))
  end

  private

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

  def store_tweets
    @tweet_data = @response["data"]
   if @tweet_data
      @tweet_users = @response["includes"]["users"]

      @tweet_data.each do |tweet|
        next if Tweet.find_by(tweet_id: tweet.dig("id"))

        author_id = tweet["author_id"]
        author = @tweet_users.find { |user| user["id"] == author_id }
        url = tweet.dig("entities","urls")
        Tweet.create!(text: tweet.dig("text"), twitter_block: @twitter_block, user: author.dig("name"),
                      username: author.dig("username"), profile_picture: author.dig("profile_image_url"),
                      url: tweet.dig('entities', 'urls', 0, "expanded_url"), tweet_id: tweet.dig("id"))

          # & = si l'objet pr??c??dent est d??fini alors OK et continue, sinon renvoi nil
      end
    end
  end
end
