class AddPostReferenceToCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :category, null: true, foreign_key: true
  end
end
