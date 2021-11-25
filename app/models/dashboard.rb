class Dashboard < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  has_many :positions
end
