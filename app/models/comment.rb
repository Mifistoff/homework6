class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :commentator, polymorphic: true

  validate :body
end
