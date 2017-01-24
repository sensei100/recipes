class ReviewsController < ApplicationController
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.build(review_params)
    @review.chef = current_user
    if @review.save
      flash[:success] = "Your review was successfully created"
      redirect_to recipe_path(@recipe)
    else
      redirect_to :back
    end
  end
  
  private
  
    def review_params
      params.require(:review).permit(:content)
    end
  
end