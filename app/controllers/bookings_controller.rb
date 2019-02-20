class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  skip_after_action :verify_authorized, only:[:search]

  def edit

  end

  def create
    @painting = Painting.find(params[:painting_id])
    @booking = Booking.new
    @booking.start_date = params[:booking][:start_date]
    @booking.end_date = params[:booking][:end_date]
    @booking.painting = @painting
    @booking.user = current_user
    @booking.total_paid = @booking.painting.price
    authorize @booking
    if @booking.save
      redirect_to dashboard_path, notice: 'Booking was successfully created'
    else
      redirect_to painting_path(params[:painting_id])
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to dashboard_path, notice: 'Booking was successfully updated'
    else
      render :edit
    end
  end

  def destroy

  end

    def set_boooking
      @booking = Booking.find(params[:id])
      authorize @booking
    end

    def booking_params
      params.require(:booking).permit(:start_date, :end_date)
    end
  end
end
