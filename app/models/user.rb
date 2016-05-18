class User < ActiveRecord::Base
    # https://www.railstutorial.org/book/modeling_users 6.10
    before_save {self.email = email.downcase}
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: {with: VALID_EMAIL_REGEX},
                      uniqueness: {case_sensitive: false}
    validates :password, presence: true, length: {minimum: 6}

    # this is a rails built in function, bassically stores our passwords as a hash on the db.
    # just make sure we have a password_digest atttribute to our users and add the bcrypt gem
    has_secure_password
end
