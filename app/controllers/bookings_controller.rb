require 'date'

class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  skip_after_action :verify_authorized, only:[:create]

  def edit
    @booking = Booking.where(params[:id])
    authorize @booking
  end

  def create
    if params[:booking][:start_date].empty? || params[:booking][:end_date].empty?
      redirect_to painting_path(params[:painting_id])
    else
      @painting = Painting.find(params[:painting_id])
      @booking = Booking.new
      @booking.start_date = params[:booking][:start_date]
      @booking.end_date = params[:booking][:end_date]
      @booking.painting = @painting
      @booking.user = current_user
      start = DateTime.parse(@booking.start_date)
      endate = DateTime.parse(@booking.end_date)
      @booking.total_paid = (endate - start) * @booking.painting.price
      authorize @booking
      if @booking.save
        redirect_to dashboard_path, notice: 'Booking was successfully created'
      else
        redirect_to painting_path(params[:painting_id])
      end
    end
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

  private

  def set_boooking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
