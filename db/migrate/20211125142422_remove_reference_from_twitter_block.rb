class RemoveReferenceFromTwitterBlock < ActiveRecord::Migration[6.0]
  def change
    remove_reference :twitter_blocks, :dashboard, foreign_key: true
  end
end
