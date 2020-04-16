class ColorsController < ApplicationController
  before_action :find_color, only: [:edit, :update, :destroy]

  def new
    @color = Color.new
    authorize @color
  end

  def create
    @color = Color.new(color_params)
    authorize @color
    if @color.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit
    authorize @color
  end

  def update
    authorize @color
    if @color.update(color_params)
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  def destroy
    authorize @color
    @color.destroy
    redirect_to dashboard_path
  end

  private

  def find_color
   @color = Color.find(params[:id])
  end

  def color_params
    params.require(:color).permit(:name, :color_code)
  end
end
