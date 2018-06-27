class Chore < ApplicationRecord
  belongs_to :user
  validates  :description,      presence: true
  validates  :time_to_complete, presence: true
  validates  :priority,         presence: true
  validates  :user_id,          presence: true
end
