class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  has_many :tasks, dependent: :destroy
  has_many :comments, as: :commentator, dependent: :destroy
end
