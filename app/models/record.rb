class Record < ApplicationRecord
  belongs_to :user
  
  validates :material, presence: true, length: { maximum: 50 }
  validates :memo, presence: true, length: { maximum: 255 }
end