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

  def top_graph(coin, start_date, end_date)
    url = "/assets/#{coin}/metrics/price/time-series?start=#{start_date}&end=#{end_date}&interval=1d"
    res = self.class.get(url, @options)
    data = JSON.parse(res.body)["data"]["values"].map { |value| value[4] }
    start_date = Date.parse(start_date)
    end_date = Date.parse(end_date)
    current_date = start_date - 1
    time_data = data.map do |value|
      current_date += 1
      [current_date, value]
    end.to_h
    time_data
  end
end

# <%= area_chart MessariApi.new.top_graph("Bitcoin", "2020-01-01", "2020-01-07") %>
