class User < ApplicationRecord
  has_many :own_tests, class_name: "Test", foreign_key: "author_id"
  has_many :tests_users
  has_many :tests, through: :tests_users

  validates :name, presence: true
  validates :email, presence: true
end
