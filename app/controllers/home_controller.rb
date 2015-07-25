class HomeController < ApplicationController
  
  expose(:images) { Image.all }
  expose(:galleries) { Gallery.all }
  
end
