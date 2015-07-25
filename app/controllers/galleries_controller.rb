class GalleriesController < ApplicationController

  
  expose(:gallery)

  def index
    @user = User.find(params[:user_id])
    @galleries = @user.galleries
  end

  def show
  end

  def edit
  end

  def update
    if @gallery.update_attributes(secure_params)
      redirect_to user_gallery_path(@gallery.user, @gallery), :notice => "Gallery updated."
    else
      redirect_to user_gallery_path(@gallery.user, @gallery), :alert => "Unable to update gallery."
    end
  end

  def destroy
    @gallery.destroy
    redirect_to user_gallery_path(@gallery.user, @gallery), :notice => "Gallery deleted."
  end

  def new
  end

  private

  def secure_params
    params.require(:gallery).permit()
  end

end
