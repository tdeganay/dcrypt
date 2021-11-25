class MessariApi
  include HTTParty
  base_uri 'data.messari.io/api/v1/'

  def initialize
     @options = { headers: { "x-messari-api-key": ENV["MESSARI_API_KEY"] } }
  end


  def top_metrics
    url = '/assets?fields=id,slug,symbol,metrics/market_data/price_usd'
    res = self.class.get(url, @options)
    JSON.parse(res.body)
  end

  # def top_graph(coin, start_date, end_date)
  #   url = '/assets?fields=id,slug,symbol,metrics/market_data/price_usd'
  #   res = self.class.get(url, @options)
  #   JSON.parse(res.body)
  # end


  #   top_graphs = JSON.parse(URI.open(url).read)["data"]
  # top_graphs.each |top_graph| do
  #   crypto_view = {
  #    cryto: top_graph[:slug],
  #    symbol: top_graph[:symbol],
  #    price: top_graph[:metrics][:market_data][:price_usd],
  #   }
  # end

end
