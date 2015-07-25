class Gallery < ActiveRecord::Base
  validates :user, :images, :title, :description, presence: true

  acts_as_commentable

  belongs_to :user
  has_many :images
end
