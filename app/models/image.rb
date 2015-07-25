class Image < ActiveRecord::Base
  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: ":style/missing.png",
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    dropbox_options: {}
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
