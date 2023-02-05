class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :raise_unprocessable_entity_error
  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  private
  def raise_unprocessable_entity_error(invalid)
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity
  end

  def post_params
    params.permit(:category, :content, :title)
  end

end
