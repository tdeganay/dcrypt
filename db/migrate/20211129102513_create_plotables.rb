class CreatePlotables < ActiveRecord::Migration[6.0]
  def change
    create_table :plotables do |t|
      t.string :title
      t.string :username
      t.float :value
      t.date :current_date
      t.references :messari_block, null: false, foreign_key: true

      t.timestamps
    end
  end
end
