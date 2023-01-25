# frozen_string_literal: true

class ReviewsController < ApplicationController
  def index
    @service = Service.find(params[:service_id])
    @services = Service.where(name: @service.name)
    @services = @services.pluck(:id)
    @reviews = Review.where(service_id: @services)
  end

  def new
    @service = Service.find(params[:service_id])
    @review = @service.build_review
  end

  def create
    @service = Service.find(params[:service_id])
    @review = @service.build_review(review_params)
    respond_to do |format|
      if @review.save

        format.html { redirect_to availed_services_path, notice: 'Review was successfully created' }

      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    @service = Service.find(params[:availed_service_id])
    @review = Review.find(params[:id])
  end

  def edit
    @service = Service.find(params[:availed_service_id])
    @booking = Review.find(params[:id])
  end

  def update
    @service = Service.find(params[:service_id])
    @review = Review.find(params[:id])
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to availed_services_path, notice: 'Review was successfully updated.' }

      else
        format.html { render :edit, status: :unprocessable_entity }

      end
    end
  end

  def destroy
    @service = Service.find(params[:service_id])
    @review = Review.find(params[:id])
    @review.destroy
    respond_to do |format|
      format.html { redirect_to availed_services_url, notice: 'Review was successfully destroyed.' }
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :reviewer)
  end
end
