class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized, only:[:search]

  def search

  end

  def index
    @bookings = policy_scope(Booking)
    @bookings = Booking.all
  end

  def show

  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def edit

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path, notice: 'Booking was successfully created'
    else
      render :new
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
      params.require(:booking).permit(:start_date, :end_date, :total_paid)
    end
end
