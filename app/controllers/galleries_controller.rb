class GalleriesController < ApplicationController  
  expose(:gallery, attributes: :secure_params)

  def show
  end

  def edit
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

  def new
  end

  def create
    
  end

  private

  def secure_params
    params.require(:gallery).permit(:title, :description)
  end

end
