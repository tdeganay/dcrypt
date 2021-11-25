class Position < ApplicationRecord
  belongs_to :block, polymorphic: true
  belongs_to :dashboard
end
