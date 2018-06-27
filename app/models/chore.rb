class Chore < ApplicationRecord
  belongs_to :user
  validates  :description,      presence: true, length: { maximum: 255 }
  validates  :time_to_complete, presence: true, length: { maximum: 15 }
  validates  :priority,         presence: true
  validates  :user_id,          presence: true
end
