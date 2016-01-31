class User < ActiveRecord::Base
  has_many :lines, dependent: :destroy
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
