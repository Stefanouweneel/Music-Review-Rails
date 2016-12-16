class AddAristReferenceToPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :artists, foreign_key: true
  end
end
