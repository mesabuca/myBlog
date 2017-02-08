class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
  has_and_belongs_to_many :categories
end
