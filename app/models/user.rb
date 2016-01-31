class User < ActiveRecord::Base
  # relations
  has_many :lines, dependent: :destroy

  # validations
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  validates_format_of :password, with: /\A[a-zA-Z0-9\!\*\?\$]\A{8,20}/, on: :create
  validates_format_of :name, with: /\A[a-zA-Z0-9]\S{3,12}/, on: :create

  scope :ci_find, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }

  # hooks
  # before_create, after_validation, etc

  # methods

end
