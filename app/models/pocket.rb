class Pocket < ApplicationRecord
  belongs_to :user
  
  has_many :knowhows
  
  validates :pocket_name, presence: true, length: { maximum: 100 }
  
end
