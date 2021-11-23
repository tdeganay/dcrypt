class CreateKeyFiguresBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :key_figures_blocks do |t|
      t.references :dashboard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
