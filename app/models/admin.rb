class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  # devise :database_authenticatable, :trackable, :timeoutable, :lockable

  has_many :tasks
  has_many :comments, as: :commentator, dependent: :destroy
end
