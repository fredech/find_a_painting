class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only:[:search, :index]


  def index
    @painting = policy_scope(Painting)
    if params[:paintings][:author].nil?
      if params[:paintings][:location].empty? && params[:paintings][:style].empty?
        @paintings = Painting.all
      elsif params[:paintings][:location].empty? && params[:paintings][:style].empty? == false
         param_1=  "%#{params[:paintings][:style]}%"
         sql_query = "paintings.style @@ ?"
         query = sql_query, param_1
         @paintings = Painting.where(query)
      elsif params[:paintings][:style].empty? && params[:paintings][:location].empty? == false
         param_1=  "%#{params[:paintings][:location]}%"
         sql_query = "paintings.location @@ ?"
         query = sql_query, param_1
         @paintings = Painting.where(query)
      else
        sql_query = " \
          paintings.location @@ ? \
          AND paintings.style @@ ? \
        "
        param_1 = "%#{params[:paintings][:location]}%"
        param_2 = "%#{params[:paintings][:style]}%"
        query = sql_query, param_1, param_2
        @paintings = Painting.where(query)
      end
    end

    @markers = @paintings.map do |painting|
      {
        lng: painting.longitude,
        lat: painting.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { painting: painting }),
        image_url: helpers.asset_url('map_pin.png')
      }
    end
    # @paintings = Painting.where.not(latitude: nil, longitude: nil)
    # @markers = @paintings.map do |painting|
      # {
      #   lng: painting.longitude,
      #   lat: painting.latitude,
      #   infoWindow: render_to_string(partial: "infowindow", locals: { painting: painting }),
      #   image_url: helpers.asset_url('map_pin.png')
      # }
    # end
  end

  def show
  end

  def new
    @painting = Painting.new
    authorize @painting
  end

  def edit
    @painting = Painting.new
    authorize @painting
  end

  def create
    @painting = Painting.new(painting_params)
    @painting.user = current_user
    authorize @painting
    if @painting.save
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

  def search

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


 # def search
 #    if params[:search][:location].empty? && params[:search][:style].empty?
 #      redirect_to paintings_path
 #    elsif params[:search][:location].empty? && params[:search][:style].empty? == false
 #       @paintings = Painting.where(style: params[:search][:style])
 #    elsif params[:search][:style].empty? && params[:search][:location].empty? == false
 #       @paintings = Painting.where(location: params[:search][:location])
 #    else
 #      @paintings = Painting.where(location: params[:search][:location], style: params[:search][:style])
 #    end

 #    @markers = @paintings.map do |painting|
 #      {
 #        lng: painting.longitude,
 #        lat: painting.latitude,
 #        infoWindow: render_to_string(partial: "infowindow", locals: { painting: painting }),
 #        image_url: helpers.asset_url('map_pin.png')
 #      }
 #  end
