class AddTitleToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :title, :string
    add_column :articles, :description, :string
    add_column :articles, :author, :string
    add_column :articles, :url, :string
    add_column :articles, :image_url, :string
    add_column :articles, :published_at, :string
    add_column :articles, :text, :string
  end
end
