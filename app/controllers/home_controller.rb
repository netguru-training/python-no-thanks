class HomeController < ApplicationController
  expose(:images) { Image.all }
end
