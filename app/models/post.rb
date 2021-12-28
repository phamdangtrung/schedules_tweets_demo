class Post < ApplicationRecord
  has_rich_text :body
  belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
end
