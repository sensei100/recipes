class CuisinesController < ApplicationController
  
  def new
    @cuisine = Cuisine.new
  end
  
  def create
    @cuisine = Cuisine.new(cuisine_params)
    if @cuisine.save
      flash[:success] = "Cuisine was successfully created"
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  
  def show
    @cuisine = Cuisine.find(params[:id])
    @recipes = @cuisine.recipes.paginate(page: params[:page], per_page: 4)
  end
  
  private
  
    def cuisine_params
      params.require(:cuisine).permit(:name)
    end
  
end