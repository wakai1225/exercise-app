class Exercise < ApplicationRecord
  validates :exercise, presence: true
  
  belongs_to :user
end
