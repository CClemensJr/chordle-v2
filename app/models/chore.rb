class Chore < ApplicationRecord
  belongs_to :user

  #default_scope -> { order(created_at: :desc) }

  validates  :user_id,          presence: true
  validates  :description,      presence: true, length: { maximum: 255 }
  validates  :time_to_complete, presence: true, numericality: true
  validates  :priority,         presence: true, inclusion: { in: %w(Low Medium High), message: "%{ value } is not a valid priority level" }

  def self.complete_this_chore
    Chore.order("RANDOM()").first.description if Chore
  end
end
