class Comment < ApplicationRecord
    belongs_to :course
    validates :comment, presence: true
end