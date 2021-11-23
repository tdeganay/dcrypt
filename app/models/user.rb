class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  regex_email = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: { with: regex_email }, presence: true
  validates :username, presence: true
  has_many :dashboards
  # has_many :twitter_blocks, :news_blocks, :key_figures_blocks, through: :dashboards
end
