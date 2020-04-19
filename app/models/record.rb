class Record < ApplicationRecord
  belongs_to :user
  
  validates :material, presence: true, length: { maximum: 50 }
  validates :memo, presence: true, length: { maximum: 255 }
  
  def self.total_minutes(study_time)
    sum(:study_time)
  end
end