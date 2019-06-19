class Metadata < ActiveRecord::Base
    belongs_to :Questions
    belongs_to :Users
end