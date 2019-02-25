class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :time_spent, :date, :student_id
  has_many :comments
  belongs_to :student
end
