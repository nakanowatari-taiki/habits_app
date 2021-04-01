class Comment < ApplicationRecord
  belongs_to :plan
  belongs_to :user
  validates :com, presence: true 
end
