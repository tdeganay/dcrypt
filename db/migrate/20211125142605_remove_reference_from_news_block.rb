class RemoveReferenceFromNewsBlock < ActiveRecord::Migration[6.0]
  def change
  remove_reference :news_blocks, :dashboard, foreign_key: true
  end
end
