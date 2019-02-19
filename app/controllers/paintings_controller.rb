class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  def search
  end

  def index
    @paintings = policy_scope(Painting)
    @paintings = Painting.all
  end

  def show
  end

  def new
    @painting = Painting.new
    authorize @painting
  end

  def edit
  end

  def create
    @painting = Painting.new(painting_params)
    @painting.user = current_user
    authorize @painting
    if @painting.save?
      redirect_to @painting, notice: 'Painting was successfully created.'
    else
      render :new
    end
  end

  def update
    if @painting.update(painting_params)
      redirect_to painting_path(@painting_id), notice: 'Painting was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @painting.destroy
    redirect_to paintings_path, notice: 'Painting was successfully destroyed'
  end

  private

  def set_painting
    @painting = Painting.find(params[:id])
    authorize @painting
  end

  def painting_params
    params.require(:painting).permit(:name, :location, :price, :author, :style, :availabilities, :photo)
  end
end
