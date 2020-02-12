class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all.sort { |a, b| a.name <=> b.name }
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render new_cocktail_path
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
