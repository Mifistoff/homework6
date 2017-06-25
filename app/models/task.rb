class Task < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  has_many :comments, dependent: :destroy

  enum status: { active: 0, archived: 1 }
end
