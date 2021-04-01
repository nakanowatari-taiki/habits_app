class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :part
  belongs_to :user
  has_many   :comments, dependent: :destroy
  
  with_options presence: true do
  validates :part_id, numericality: { other_than: 1 } 
  validates :date 
  validates :text
  end
end
