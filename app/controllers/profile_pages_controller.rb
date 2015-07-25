class ProfilePagesController < ApplicationController
  before_action :authenticate_user!

  expose_decorated(:profile, model: :user, decorator: ProfilePageDecorator)

  def show
  end
end
