class NewsApi

  def initialize(news_block = nil)
    @news_block = news_block

  end

  def call
    response = api_call
    if response.return_code == :ok
      JSON.parse(response.response_body).dig('articles').each do |article|
        Article.create!(news_block: @news_block, title: article.dig('title'),author: article.dig('author'), description: article.dig('description'), url: article.dig('url'),
                        image_url: article.dig('urlToImage'), published_at: article.dig('publishedAt'), text: article.dig('content'))

      end
    end
  end

  def api_call
    api_token = ENV["API_KEYWORD_NEWS"]
    # query = @news_block.user_string
    url = "https://newsapi.org/v2/everything?q=bitcoin&from=2021-10-29&sortBy=publishedAt&apiKey=#{api_token}"

    options = {
      method: 'get',
      # headers: {
      #   "User-Agent": "v2RecentSearchRuby",
      #   "Authorization": "Bearer #{bearer_token}"
      # }
      # params: query_params
    }

    request = Typhoeus::Request.new(url, options)
    response = request.run

    return response
  end

end
