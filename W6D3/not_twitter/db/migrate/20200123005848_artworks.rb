class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :title, :image_url, :artist_id presence: true, uniqueness: true
    end
  end
end
