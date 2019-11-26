class User < ApplicationRecord

    validates :user_name, :password_digest, :session_token, presence: true
    validates :user_name, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil: true}
    
    before_validation :ensure_session_token

    has_many :cats,
        foreign_key: :user_id,
        class_name: 'Cat'


    attr_reader :password

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        return nil unless user
        user.is_password?(password) ? user : nil 
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end
end
