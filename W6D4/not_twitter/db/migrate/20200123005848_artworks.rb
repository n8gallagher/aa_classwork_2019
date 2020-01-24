class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork do |t|
      t.string :title, :image_url, :artist_id, null: false, unique: true
    end
  end
end
