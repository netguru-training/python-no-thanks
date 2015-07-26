class Gallery < ActiveRecord::Base
  acts_as_commentable

  has_many :images
  belongs_to :user

  validates :user, :images, :title, :description, presence: true
  accepts_nested_attributes_for :images, allow_destroy: true
end
