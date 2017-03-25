# frozen_string_literal: true
# :nodoc:
class RecipesController < OpenReadController
  before_action :set_recipe, only: [:show, :update, :destroy]
  before_action :set_cookbook, only: [:index, :create]

  # GET /recipes
  def index
    @recipes = @cookbook.recipes

    render json: @recipes
  end

  # GET /recipes/1
  def show
    render json: @recipe
  end

  # POST /recipes
  def create
    @recipe = @cookbook.recipes.new(recipe_params)

    if @recipe.save
      render json: @recipe, status: :created
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def set_cookbook
      @cookbook = Cookbook.find(params[:cookbook_id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params
        .require(:recipe)
        .permit(:name, :start_page, :end_page, :comments)
    end
end
