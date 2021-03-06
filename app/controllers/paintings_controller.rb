class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:edit, :index, :show]
  skip_after_action :verify_authorized, only:[:update, :search, :index]


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
    else
      if params[:paintings][:location].empty? && params[:paintings][:style].empty? && params[:paintings][:author].empty?
        @paintings = Painting.all
      elsif params[:paintings][:location].empty? && params[:paintings][:style].empty? == false && params[:paintings][:author].empty?
         param_1=  "%#{params[:paintings][:style]}%"
         sql_query = "paintings.style @@ ?"
         query = sql_query, param_1
         @paintings = Painting.where(query)
      elsif params[:paintings][:style].empty? && params[:paintings][:location].empty? == false && params[:paintings][:author].empty?
         param_1=  "%#{params[:paintings][:location]}%"
         sql_query = "paintings.location @@ ?"
         query = sql_query, param_1
         @paintings = Painting.where(query)
      elsif params[:paintings][:style].empty? && params[:paintings][:location].empty? && params[:paintings][:author].empty? == false
         param_1=  "%#{params[:paintings][:author]}%"
         sql_query = "paintings.author @@ ?"
         query = sql_query, param_1
         @paintings = Painting.where(query)
      elsif params[:paintings][:style].empty? == false && params[:paintings][:location].empty? == false && params[:paintings][:author].empty?
         param_1=  "%#{params[:paintings][:style]}%"
         param_2=  "%#{params[:paintings][:location]}%"
         sql_query = " \
          paintings.style @@ ? \
          AND paintings.location @@ ? \
          "
         query = sql_query, param_1, param_2
         @paintings = Painting.where(query)
      elsif params[:paintings][:style].empty? == false && params[:paintings][:location].empty? && params[:paintings][:author].empty? == false
         param_1=  "%#{params[:paintings][:style]}%"
         param_2=  "%#{params[:paintings][:author]}%"
         sql_query = " \
          paintings.style @@ ? \
          AND paintings.author @@ ? \
          "
         query = sql_query, param_1, param_2
         @paintings = Painting.where(query)
      elsif params[:paintings][:style].empty? && params[:paintings][:location].empty? == false && params[:paintings][:author].empty? == false
         param_1=  "%#{params[:paintings][:location]}%"
         param_2=  "%#{params[:paintings][:author]}%"
         sql_query = " \
          paintings.location @@ ? \
          AND paintings.author @@ ? \
          "
         query = sql_query, param_1, param_2
         @paintings = Painting.where(query)
      else
        sql_query = " \
          paintings.location @@ ? \
          AND paintings.style @@ ? \
          AND paintings.author @@ ? \
        "
        param_1 = "%#{params[:paintings][:location]}%"
        param_2 = "%#{params[:paintings][:style]}%"
        param_3 = "%#{params[:paintings][:author]}%"
        query = sql_query, param_1, param_2, param_3
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
  end

  def show
    @booking = Booking.new
    @d = DateTime.now
    if params[:start_date].empty? || params[:end_date].empty?
      @start_date = @d.strftime("%d/%m/%Y")
      @end_date = @d.next_day.strftime("%d/%m/%Y")
    else
      @start_date = params[:start_date]
      @end_date = params[:end_date]
    end
    start = DateTime.parse(@start_date)
    endate = DateTime.parse(@end_date)
    @total_paid = ((endate - start) * @painting.price).to_i
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
    if @painting.save
      redirect_to dashboard_path, notice: 'Painting was successfully created.'
    else
      render :new
    end
  end

  def update
    if @painting.update(painting_params)
      redirect_to dashboard_path, notice: 'Painting was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting_id = @painting.id
    if @painting.destroy
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js { } # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'dashboard' }
        format.js { } # <-- idem
      end
    end
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
