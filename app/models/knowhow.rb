class Knowhow < ApplicationRecord
  belongs_to :pocket
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 50 }
  
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites, source: :user
  
  def self.search(search)
    if search
      where(["title LIKE ?", "%#{search}%"])
    else
      all
    end
  end
end
