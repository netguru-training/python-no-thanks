class HomeController < ApplicationController
  expose(:images) { find_images }
  
  private
  
  def find_images
    if tag = params[:tag]
      Image.tagged_with([tag], :any => true)
    elsif word = params[:search]
      Image.where('title ILIKE ?', "%#{word}%")
    else
      Image.all
    end
  end
end
