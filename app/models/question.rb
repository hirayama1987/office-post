class Question < ApplicationRecord
    belongs_to :status
    
    validates :question, presence: true
end
