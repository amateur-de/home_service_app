# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_resource_service
  def new
    @booking = @service.build_booking
    authorize @booking
  end

  def create
    @booking = @service.build_booking(booking_params)
    authorize @booking
    respond_to do |format|
      if @booking.save
        @service.ongoing!
        format.html { redirect_to available_services_path, notice: 'Service was successfully booked' }

      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to availed_services_path, notice: 'Booking was successfully updated.' }

      else
        format.html { render :edit, status: :unprocessable_entity }

      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    @service.available!
    respond_to do |format|
      format.html { redirect_to availed_services_url, notice: 'Booking was successfully destroyed.' }
    end
  end

  def booking_params
    params.require(:booking).permit(:time, :address, :contact, :admin_user_id)
  end
end
