class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.boolean :is_public

      t.timestamps
    end
  end
end
