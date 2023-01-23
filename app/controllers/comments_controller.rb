# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    @service = Service.find(params[:service_id])
    @comments = @service.comments.all
  end

  def new
    @service = Service.find(params[:service_id])
    @comment = @service.comments.build
  end

  def create
    @service = Service.find(params[:service_id])
    @comment = @service.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        @service.rejected!
        format.html do
          redirect_to pending_services_path, notice: 'Service was rejected and Comment was successfully created'
        end

      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
