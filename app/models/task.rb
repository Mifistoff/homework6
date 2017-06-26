class Task < ApplicationRecord
  belongs_to :user
  belongs_to :admin, optional: :true
  has_many :comments, dependent: :destroy

  enum status: [ :active, :closed ]

  def change_status
    active? ? closed! : active!
  end
end
