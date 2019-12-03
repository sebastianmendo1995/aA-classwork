class User < ApplicationRecord

    validates :username, :password_digest, :session_token, presence: true
    validates :username, uniqueness:true
    validates :password, length: {minimum: 6, allow_nil: true}

    after_initialize :ensure_session_token
    # before_validation :ensure_session_token
    #   before_validation does not work with the existing specs because...
    #   before_validation is giving the instance a session token AFTER
    #   shoulda-matchers is setting session token to nil. 
    #   This is bad because shoulda-matchers is trying to fail the validation.

    attr_reader :password

    def ensure_session_token 
        self.session_token ||= SecureRandom.urlsafe_base64
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user
        user.is_password?(password) ? user : nil
    end
    
    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save
        self.session_token
    end
end
