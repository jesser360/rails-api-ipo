class RemoveImageFromArtists < ActiveRecord::Migration[5.2]
  def change
    remove_column :artists, :image, :string
  end
end
