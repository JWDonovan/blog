class Post < ApplicationRecord
    validates :title, :slug, :datetime, :published, :comments_enabled, presence: true
    validates :slug, uniqueness: true

    has_rich_text :body
    has_one_attached :hero_image
end
