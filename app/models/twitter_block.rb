class TwitterBlock < ApplicationRecord
  belongs_to :dashboard
  validates :dashboard_id, presence: true
end