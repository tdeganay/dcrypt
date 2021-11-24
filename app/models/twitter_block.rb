class TwitterBlock < ApplicationRecord
  belongs_to :dashboard
  has_many :tweets
  validates :dashboard_id, presence: true
end
