class AddImageDataToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :image_data, :text
  end
end
