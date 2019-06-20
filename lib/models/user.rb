class User < ActiveRecord::Base
    has_many :metadata
    has_many :questions, through: :metadata
end