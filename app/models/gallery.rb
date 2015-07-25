class Gallery < ActiveRecord::Base
  validates :user, presence: true
  validates :images, presence: true # We wonder if it'll work
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :images
end
