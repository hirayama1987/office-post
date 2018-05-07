class Question < ApplicationRecord
    belongs_to :status
    belongs_to :user
    
    validates :question, presence: true
end
