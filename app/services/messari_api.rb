class MessariApi
  include HTTParty
  base_uri 'data.messari.io/api/v1/'

  def initialize(messari_block)
    @messari_block = messari_block
    @options = { headers: { "x-messari-api-key": ENV["MESSARI_API_KEY"] } }
  end

  def top_metrics
    url = '/assets?fields=id,slug,symbol,metrics/market_data/price_usd'
    res = self.class.get(url, @options)
    JSON.parse(res.body)
  end


  def top_graph(start_date = "2021-09-01", end_date = "2021-10-01")
    start_date = Date.parse(start_date)
    # end_date = Date.parse(end_date)
    current_date = start_date - 1
    if @messari_block.plotables.empty?
      url = "/assets/#{@messari_block.user_string}/metrics/price/time-series?start=#{start_date}&end=#{end_date}&interval=1d"
      res = self.class.get(url, @options)
      data = JSON.parse(res.body)["data"]["values"].map { |value| value[4] }
      time_data = data.map do |value|
        current_date += 1
        [current_date, value.fdiv(1000)]
      end.to_h

    else
      time_data = @messari_block.plotables.map do |plotable|
        [ plotable.current_date, plotable.value ]
      end.to_h
    end
    time_data
  end


  def create_entries
    top_graph.each do |key, value|
      Plotable.create!(value: value, current_date: key, messari_block: @messari_block)
    end
  end

end



# <%= area_chart MessariApi.new.top_graph("Bitcoin", "2020-01-01", "2020-01-07") %>
