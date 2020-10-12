class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "first ingredient")
    @recipe.ingredients.build(name: "second ingredient")
  end

  def create
    @recipe = Recipe.new(recipes_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end 
  end

  def recipes_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes:[
        :name,
        :quantity
        ]
      )
  end 

end
