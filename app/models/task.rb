class Task < ApplicationRecord
  belongs_to :user
  belongs_to :admin, optional: :true
  has_many :comments, dependent: :destroy

  enum status: { active: 0, closed: 1 }
end
