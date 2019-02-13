class CourseStudentSerializer < ActiveModel::Serializer
  attributes :student_id, :course_id
  belongs_to :student
  belongs_to :course
end
