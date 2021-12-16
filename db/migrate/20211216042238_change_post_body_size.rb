class ChangePostBodySize < ActiveRecord::Migration[6.1]
  def change
    change_table :posts do |t|
      t.change :body, :text
    end
  end
end
