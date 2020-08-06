class Gossip < ApplicationRecord
    belongs_to :user
    has_many :tagossips
    has_many :tags, through: :tagossips
    has_many :comments
  
    validates :content, presence: true
    validates :title, 
    presence: true, length: { minimum: 3, maximum: 500 }
end
