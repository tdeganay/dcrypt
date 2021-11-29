class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :news_block, null: false, foreign_key: true

      t.timestamps
    end
  end
end
