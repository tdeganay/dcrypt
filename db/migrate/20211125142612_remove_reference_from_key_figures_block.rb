class RemoveReferenceFromKeyFiguresBlock < ActiveRecord::Migration[6.0]
  def change
    remove_reference :key_figures_blocks, :dashboard, foreign_key: true
  end
end
