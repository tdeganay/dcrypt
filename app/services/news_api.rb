class NewsApi

  def initialize(news_block = nil)
    @news_block = news_block
    # @symbol = @news_block.symbol
  end

  def call
    response = api_call
    if response.return_code == :ok
      JSON.parse(response.response_body).dig('data').each do |article|
        #puts article.dig('title')
        # Article.create(news_block: @news_block, title: article.dig('title'), description: article.dig('description'))
      end
    end
  end

  def api_call
    api_token = ENV["API_KEYWORD_NEWS"]
    # query = @news_block.user_string
    url = "https://newsapi.org/v2/everything?q=gmx&from=2021-10-29&sortBy=publishedAt&apiKey=#{api_key}"

    options = {
      method: 'get',
      headers: {
        "User-Agent": "v2RecentSearchRuby",
      #   "Authorization": "Bearer #{bearer_token}"
      }
      # params: query_params
    }

    request = Typhoeus::Request.new(url, options)
    response = request.run

    return response
  end

end
