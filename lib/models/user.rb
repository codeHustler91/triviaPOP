class User < ActiveRecord::Base
    has_many :Metadatas
    has_many :Questions, through: :Metadatas
end