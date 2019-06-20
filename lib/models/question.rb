class Question < ActiveRecord::Base
    has_many :metadata
    has_many :users, through: :metadata
end