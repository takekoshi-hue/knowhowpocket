class Pocket < ApplicationRecord
  belongs_to :user
  
  has_many :knowhows
  has_many :knowhows, dependent: :destroy
  
  validates :pocket_name, presence: true, length: { maximum: 100 }
  
  
end
