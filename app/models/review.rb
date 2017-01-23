class Review < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe
  validates :content, presence: true, length: { minimum: 20, maximum:500 }
  validates :chef_id, presence: true
  validates :recipe_id, presence: true
end