# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_resource_service
  def index
    @comments = @service.comments.all
    authorize @comments
  end

  def new
    @comment = @service.comments.build
    authorize @comment
  end

  def create
    @comment = @service.comments.build(comment_params)
    authorize @comment
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
