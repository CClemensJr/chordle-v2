class User < ApplicationRecord
    before_save { self.email = email.downcase } # email addresses are down cased by default to address case sensitivity

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :name, 
              presence:   true, 
              length:   { maximum: 50 }

    validates :email, 
               presence:     true, 
               length:     { maximum: 200 }, 
               format:     { with: VALID_EMAIL_REGEX },
               uniqueness: { case_sensitive: false }

    has_secure_password

    validates :password, 
              presence:  true, 
              length:  { minimum: 9 },
              allow_nil: true

    # Returns the hash digest of a string argument
    def User.digest(string)
        # Cost is the variable that BCrypt uses to determin how complex to make the password digest. 
        # Here we are assigning the lowest value to cost as possible to speed up testing.
        # The value of cost is the minimum cost if it is actually the minimum cost otherwise assign the value of Engine.cost
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

        # Create the hashed password based on the minimum cost
        BCrypt::Password.create(string, cost: cost)
    end
    
end
