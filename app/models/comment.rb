class Comment < ApplicationRecord
    belongs_to :course
    belongs_to :student
    validates :comment, presence: true
end