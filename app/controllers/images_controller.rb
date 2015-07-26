class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :is_owner?, only: [:edit, :update, :destroy]

  expose(:gallery) { find_gallery }
  expose(:image, attributes: :image_params)

  def create
    image.user = current_user
    image.tag_list.add(params[:image][:tags], parse: true)
    gallery.images << image
    
    if gallery.save
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

  def upvote
    image.upvote_by current_user
    redirect_to :back
  end

  def downvote
    image.downvote_by current_user
    redirect_to :back
  end

  private

  def find_gallery
    Gallery.find_by(id: params[:image][:gallery_id])
  end
  
  def image_params
    params.require(:image).permit(:picture, :tag_list, :title, :description)
  end

  def is_owner?
    if current_user != gallery.user && !current_user.nil?
      redirect_to new_user_session_path, alert: 'You are not allowed to edit this gallery.'
    end
  end
end
