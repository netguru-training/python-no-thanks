class Image < ActiveRecord::Base
  acts_as_commentable

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: ":style/missing.png",
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    dropbox_options: {}

  acts_as_taggable_on :funny, :sad, :ruby

  belongs_to :user
  belongs_to :gallery

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates :user, :title, :description, :gallery, presence: true
end
