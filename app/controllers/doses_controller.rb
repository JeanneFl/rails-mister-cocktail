class DosesController < ApplicationController

  def update
    @dose = Dose.find(params[:cocktail_id])
    @dose.update(params_dose)
    redirect_to cocktail_path
  end

  def show
    @dose = Dose.find(params[:cocktail_id])
  end

  def delete
    @cocktail = cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.delete
    redirect_to cocktails_path
  end

 def create
    @dose = Dose.new(params_dose)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
    redirect_to cocktail_path(@cocktail)
  else
    render 'new'
  end
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
