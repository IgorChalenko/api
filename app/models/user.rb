require "bcrypt"
class User < ApplicationRecord

    include BCrypt

    def password
        @password ||= new.(password_hash)
    end

    def password=(new_password)
        @password = Password.create(new_password)
        self.password_hash = @password
    end


    validates :name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+]+@[a-z\d]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
end
