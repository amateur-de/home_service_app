# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_resource_service
  def index
    services = Service.where(name: @service.name).pluck(:id)
    @reviews = Review.where(service_id: services).order(created_at: :desc)
    authorize @reviews
  end

  def new
    @review = @service.build_review
    authorize @review
  end

  def create
    @review = @service.build_review(review_params)
    authorize @review
    respond_to do |format|
      if @review.save

        format.html { redirect_to availed_services_path, notice: 'Review was successfully created' }

      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
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
