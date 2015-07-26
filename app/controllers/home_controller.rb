class HomeController < ApplicationController

  expose(:images) { find_images }

  private
  
  def find_images
    relation = Image.includes(:gallery)
    if tag = params[:tag]
      relation.tagged_with([tag], :any => true)
    elsif word = params[:search]
      relation.where('title ILIKE ?', "%#{word}%")
    else
      relation.all
    end
  end
end
