class RecipeCuisines < ActiveRecord::Migration
  def change
    create_table :recipe_cuisines do |t|
      t.integer :cuisine_id, :recipe_id
    end
  end
end
