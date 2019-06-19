class Question < ActiveRecord::Base
    has_many :Metadatas
    has_many :Users, through: :Metadatas
end