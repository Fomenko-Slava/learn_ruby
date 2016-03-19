class User < ActiveRecord::Base
  has_many :petitions

  has_secure_password

  validates :email, presence: true, email: true
  validates :first_name, presence: true, length: { in: 2..25 }
  validates :last_name, presence: true, length: { in: 2..25 }

  validates_uniqueness_of :email
end