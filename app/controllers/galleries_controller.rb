class GalleriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :check_user_ownership!, only: [:edit, :update, :destroy]

  expose(:gallery, attributes: :strong_params)
  expose(:image, attributes: :image_params)

  def show
  end

  def new
  end

  def edit
  end

  def create
    gallery.user = current_user
    gallery.images.each { |i| i.user = current_user }

    if gallery.save
      redirect_to gallery_path(gallery), notice: "Gallery created."
    else
      render 'new'
    end
  end

  def update
    if gallery.save
      redirect_to gallery_path(gallery), notice: "Gallery updated."
    else
      render 'edit'
    end
  end

  def destroy
    if gallery.destroy
      redirect_to user_path(gallery.user), notice: "Gallery deleted."
    else
      redirect_to gallery_path(gallery), alert: "Can not destroy gallery."
    end
  end

  private

    def strong_params
      params.require(:gallery).permit(:title, :description,
          images_attributes: [:id, :title, :description, :picture, :tag_list, :picture_file_name])
    end

    def check_user_ownership!
      return unless current_user == gallery.user
      flash[:error] = "You are not permitted to do this action. Please log in."
      redirect_to new_user_session_path
    end
end
