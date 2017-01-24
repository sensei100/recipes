class ReviewsController < ApplicationController
  before_action :set_recipe
  before_action :require_user, except: [:show]
 
   
  def create
    @review = @recipe.reviews.build(review_params)
    @review.chef = current_user
    if @review.save
      flash[:success] = "Your review was successfully created"
      redirect_to recipe_path(@recipe)
    else
      redirect_to :back
    end
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:success] = "Your review was updated"
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end
  
  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "Review deleted"
    redirect_to recipe_path(@recipe)
  end
  
  private
  
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end
  
    def review_params
      params.require(:review).permit(:content)
    end

end