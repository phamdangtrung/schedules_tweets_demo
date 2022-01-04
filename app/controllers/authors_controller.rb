class AuthorsController < ApplicationController
  def index
    @authors = User.where.not(id: Current.user.id).order(id: :desc)
    @list_of_post_counts = author_post_count(@authors)
  end

  private

    def author_post_count(authors)
      hash = {}
      authors.each do |author|
        key = author.id
        value = Post.where(user_id: author.id).count
        hash[key] = value
      end

      hash
    end
end
