class AddPostTable < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.boolean :is_public, default: true

      t.timestamps
    end
  end
end
