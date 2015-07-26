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
    # gallery.user = current_user
    if gallery.save
      #
    else
      #
    end
  end

  def update
    if gallery.save
      redirect_to user_gallery_path(gallery.user, gallery), notice: "Gallery updated."
    else
      render 'edit'
    end
  end

  def destroy
    if gallery.destroy
      redirect_to user_path(gallery.user), notice: "Gallery deleted."
    else
      redirect_to user_gallery_path(gallery.user, gallery), alert: "Can not destroy gallery."
    end
  end

  private

    def strong_params
      params.require(:gallery).permit(:title, :description, images_attributes: [:picture, :tag_list, :picture_file_name, :title, :description])
    end

    def gallery_params
      params.require(:gallery).permit(:title, :description)
    end

    def image_params
      params.require(:image).permit(:picture, :tag_list)
    end

    def check_user_ownership!
      unless current_user == gallery.user
        flash[:error] = "You are not permitted to do this action. Please log in."
        redirect_to new_user_session_path
      end
    end
end
