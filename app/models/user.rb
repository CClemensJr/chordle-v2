class User < ApplicationRecord
    before_save { self.email = email.downcase } # email addresses are down cased by default to address case sensitivity

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :name, 
              presence: true, 
              length:   { maximum: 50 }

    validates :email, 
               presence:   true, 
               length:     { maximum: 200 }, 
               format:     { with: VALID_EMAIL_REGEX },
               uniqueness: { case_sensitive: false }

    has_secure_password

    validates :password, 
              presence: true, 
              length:   { minimum: 9 }
end
