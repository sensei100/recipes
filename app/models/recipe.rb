class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :reviews
  has_many :likes, dependent: :destroy
  has_many :recipe_cuisines, dependent: :destroy
  has_many :cuisines, through: :recipe_cuisines
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  validates :chef_id, presence: true
  validates :name, presence: true, length: { minimum: 5, maximum:100 }
  validates :summary, presence: true, length: { minimum: 10, maximum:150 }
  validates :description, presence: true, length: { minimum: 20, maximum:500 }
  mount_uploader :picture, PictureUploader 
  validate :picture_size
  default_scope -> { order(updated_at: :desc) }
  
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end
  
  def name=(val)
    write_attribute(:name, val.titlecase)
  end
    
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end