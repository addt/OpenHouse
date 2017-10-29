class User < ActiveRecord::Base
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: /[a-zA-Z_\.0-9]+@[a-zA-Z_\.0-9]+\.[a-zA-Z_\.0-9]+/ }
    validates :password, presence: true, length: { minimum: 8 }, on: :create
    has_secure_password
end
