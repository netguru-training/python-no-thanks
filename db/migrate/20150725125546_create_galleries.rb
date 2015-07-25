class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :description
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :galleries, :users
  end
end
