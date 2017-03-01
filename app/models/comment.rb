class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, required: false
  belongs_to :admin, required: false
end
