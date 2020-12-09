class User < ApplicationRecord
  validates :email, presence: true , uniqueness: true ,on: :create
  validates :password_digest, presence: true, length: {in: 6..20}
  has_secure_password
  has_many :scores
end
