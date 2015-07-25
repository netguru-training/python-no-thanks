class ProfilePagesController < ApplicationController
  before_action :authenticate_user!

  expose(:profile, model: :user)

  def show
  end
end
