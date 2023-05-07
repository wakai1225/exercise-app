class Exercise < ApplicationRecord
  validates :url1, presence: true
  
  belongs_to :user

end
