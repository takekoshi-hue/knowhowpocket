class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    
    has_secure_password
    
    mount_uploader :image, ImageUploader
    
    has_many :pockets
    
    has_many :relationships
    has_many :followings, through: :relationships, source: :follow
    has_many :reverses_of_relationship, class_name: "Relationship", foreign_key: "follow_id"
    has_many :followers, through: :reverses_of_relationship, source: :user
    
    has_many :knowhows
    has_many :favorites
    has_many :likes, through: :favorites, source: :knowhow

    def favorite(knowhow)
   favorites.find_or_create_by(knowhow_id: knowhow.id)
 end
 
 def unfavorite(knowhow)
   favorite = favorites.find_by(knowhow_id: knowhow.id)
   favorite.destroy if favorite
end

  def favoriting?(knowhow)
  self.likes.include?(knowhow)
  end
    
    def follow(other_user)
        unless self == other_user
        self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  
  def feed_pockets
      Pockets.where(user_id: self.id)
  end
  
    def unfollow(other_user)
        relationship = self.relationships.find_by(follow_id: other_user.id)
        relationship.destroy if relationship
    end
    
    def following?(other_user)
        self.followings.include?(other_user)
    end
    
end
