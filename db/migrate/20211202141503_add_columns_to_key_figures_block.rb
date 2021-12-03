class AddColumnsToKeyFiguresBlock < ActiveRecord::Migration[6.0]
  def change
    add_column :key_figures_blocks, :symbol, :string
    add_column :key_figures_blocks, :name, :string
    add_column :key_figures_blocks, :rank_market_cap, :integer
    add_column :key_figures_blocks, :price_usd, :float
    add_column :key_figures_blocks, :all_time_high, :float
    add_column :key_figures_blocks, :price_btc, :float
    add_column :key_figures_blocks, :price_eth, :float
    add_column :key_figures_blocks, :market_dominance, :float
    add_column :key_figures_blocks, :date_time, :date
  end
end
