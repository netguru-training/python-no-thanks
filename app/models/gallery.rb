class Gallery < ActiveRecord::Base
  validates :user, :images, :title, :description, presence: true

  belongs_to :user
  has_many :images
end
