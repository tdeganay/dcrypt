class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.references :twitter_block, null: false, foreign_key: true
      t.string :text
      t.string :user
      t.string :username
      t.string :url
      t.string :image_url
      t.date :created_on
      t.string :profile_picture

      t.timestamps
    end
  end
end
