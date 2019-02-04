class CreateCourseStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :course_students do |t|
      t.belongs_to :student_id, foreign_key: true
      t.belongs_to :course_id, foreign_key: true
      
      t.timestamps
    end
  end
end
