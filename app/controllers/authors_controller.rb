class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :raise_unprocessable_entity_error
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)

    render json: author, status: :created
  end

  private
  def raise_unprocessable_entity_error(invalid)
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity
  end
  
  def author_params
    params.permit(:email, :name)
  end
  
end
