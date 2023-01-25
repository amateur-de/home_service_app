# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    @service = Service.find(params[:service_id])
    @booking = @service.build_booking
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = @service.build_booking(booking_params)
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
    @service = Service.find(params[:service_id])
    @booking = Booking.find(params[:id])
  end

  def show
    @service = Service.find(params[:service_id])
    @booking = Booking.find(params[:id])
  end

  def update
    @service = Service.find(params[:service_id])
    @booking = Booking.find(params[:id])
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to availed_services_path, notice: 'Booking was successfully updated.' }

      else
        format.html { render :edit, status: :unprocessable_entity }

      end
    end
  end

  def destroy
    @service = Service.find(params[:service_id])
    @booking = Booking.find(params[:id])
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
