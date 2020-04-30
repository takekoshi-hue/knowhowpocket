class Knowhow < ApplicationRecord
  belongs_to :pocket
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 50 }
end
