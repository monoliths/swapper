class User < ActiveRecord::Base
    # https://www.railstutorial.org/book/modeling_users 6.10
    validates :name, presence: true
end
