class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :list_id, presence: true
  validates :comment, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id,
    message: "movie is already in the list" }
end
