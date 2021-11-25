class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.references :block, polymorphic: true, null: false
      t.references :dashboard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
