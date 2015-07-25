class AddTitleAndDescriptionAndGalleryReferenceAndUserReferenceToImages < ActiveRecord::Migration
  def change
    add_column :images, :title, :string
    add_column :images, :description, :string
    add_reference :images, :user, index: true
    add_foreign_key :images, :users
    add_reference :images, :gallery, index: true
    add_foreign_key :images, :galleries
  end
end
