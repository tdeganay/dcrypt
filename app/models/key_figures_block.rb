class KeyFiguresBlock < ApplicationRecord
  has_one :position, as: :block
  has_one :dashboard, through: :position
  has_one :user, through: :dashboard
end
