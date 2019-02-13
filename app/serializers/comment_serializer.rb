class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment
  belongs_to :course
  belongs_to :student
end
