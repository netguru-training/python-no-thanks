class ImagesController < ActionController::Base
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :is_owner?, only: [:edit, :update, :destroy]
  protect_from_forgery with: :exception
  
  expose(:gallery)
  expose(:image, attributes: :image_params)

  def create
    if gallery.images << image
      redirect_to gallery_image_path(gallery, image), notice: 'Image created'
    else
      redirect_to 'galleries/edit', alert: 'Image was not created.'
    end
  end
  
  def update
    if image.save
      redirect_to gallery_image_path(gallery, image), notice: 'Image updated.'
    else
      render :edit
    end
  end
  
  def destroy
    if image.destroy
      redirect_to gallery_path(gallery), notice: 'Image destroyed.'
    else
      redirect_to :show, alert: 'Image was not destroyed.'
    end
  end
  
  private
  
  def image_params
    params.require(:image).permit(:picture, :tag_list)
  end
  
  def is_owner?
    if current_user != gallery.user && !current_user.nil?
      redirect_to new_user_session_path, alert: 'You are not allowed to edit this gallery.'
    end
  end
end
