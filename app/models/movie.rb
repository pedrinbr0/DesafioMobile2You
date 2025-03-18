class Movie < ApplicationRecord
  validates :title, uniqueness: { scope: [:release_year, :genre, :country] }
end
