class AddPostsRefToArtists < ActiveRecord::Migration[5.0]
  def change
    add_reference :artists, :posts, foreign_key: true
  end
end
