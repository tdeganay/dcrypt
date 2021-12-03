class KeyFiguresApi
  include HTTParty
  base_uri 'data.messari.io/api/v1/'

  def initialize(key_figures_block)
    @key_figures_block = key_figures_block
    @options = { headers: { "x-messari-api-key": ENV["MESSARI_API_KEY"] } }
  end

  def top_metrics
    url = "/assets/#{@key_figures_block.user_string.downcase}/metrics"
    # url = "/assets/bitcoin/metrics"
    res = self.class.get(url, @options)
    data = JSON.parse(res.body)
    { symbol: data["data"]["symbol"],
    name: data["data"]["name"],
    rank_market_cap: data["data"]["marketcap"]["rank"],
    price_usd: data["data"]["market_data"]["price_usd"],
    all_time_high: data["data"]["all_time_high"]["price"],
    price_btc: data["data"]["market_data"]["price_btc"],
    price_eth: data["data"]["market_data"]["price_eth"],
    market_dominance: data["data"]["marketcap"]["marketcap_dominance_percent"],
    date_time: data["status"]["timestamp"],
  }
  end


  def update_block
    data = top_metrics()
    @key_figures_block.update(data)
  end

end
