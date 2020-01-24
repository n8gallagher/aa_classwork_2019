class CreateUpdatedArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :updated_artworks do |t|
      t.integer :artist_id
      t.string :image_url
      t.string :title

      t.timestamps
    end
  end
end
