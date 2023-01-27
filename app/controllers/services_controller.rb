# frozen_string_literal: true

class ServicesController < ApplicationController
  def new
    @service = current_admin_user.services.build
    authorize @service
  end

  def index
    @services = current_admin_user.services
    authorize @services
  end

  def create
    @service = current_admin_user.services.build(service_params)
    authorize @service
    respond_to do |format|
      if @service.save
        current_admin_user.seller_services.create(service_id: @service.id)
        format.html { redirect_to service_url(@service), notice: 'Service was successfully created.' }

      else
        format.html { render :new, status: :unprocessable_entity }

      end
    end
  end

  def update
    @service = Service.find(params[:id])
    authorize @service
    respond_to do |format|
      if @service.update(service_params)
        if request.referer == pending_services_url
          format.html { redirect_to pending_services_url, notice: 'Service was successfully updated.' }
        elsif request.referer == availed_services_url
          format.html { redirect_to availed_services_url, notice: 'Service was successfully updated.' }
        end
        format.html { redirect_to service_url(@service), notice: 'Service was successfully updated.' }

      else
        format.html { render :edit, status: :unprocessable_entity }

      end
    end
  end

  def edit
    @service = Service.find(params[:id])
    authorize @service
  end

  def show
    @service = Service.find(params[:id])
  end

  def destroy
    @service = Service.find(params[:id])
    authorize @service
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
    end
  end

  def pending
    @services = Service.pending
    authorize @services
    render 'pending_services/index'
  end

  def approved
    @services = Service.approved
    authorize @services
    render 'approved_services/index'
  end

  def rejected
    @services = Service.rejected
    authorize @services
    render 'rejected_services/index'
  end

  def available
    @services = Service.approved.available
    authorize @services
    render 'available_services/index'
  end

  def availed
    @services = current_admin_user.booked_services
    authorize @services
    render 'availed_services/index'
  end

  private

  def service_params
    params.require(:service).permit(:time, :location, :fee, :name, :status, :availability)
  end
end
