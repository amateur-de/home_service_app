# frozen_string_literal: true

class ServicesController < ApplicationController
  def new
    @service = current_admin_user.services.build
  end

  def index
    @services = current_admin_user.services
  end

  def create
    @service = current_admin_user.services.build(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to service_url(@service), notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    @service = Service.find(params[:id])
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to service_url(@service), notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def show
    @service = Service.find(params[:id])
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
    end
  end

  private

  def service_params
    params.require(:service).permit(:time, :location, :fee, :name, admin_user_ids:[])
  end
end
