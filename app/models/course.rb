class Course < ApplicationRecord
    has_many :course_students
    has_many :students, through: :course_students
    has_many :comments, dependent: :destroy
    belongs_to :student
    validates :name, presence: true
    validates :date, presence: true
  
    LESSONS = [
      "Introduction to Rails",
      "Rails Application Basics",
      "Rails MVC",
      "Rails Static Request",
      "Rails Hello World",
      "Video Review: Intro to Rails",
      "ActiveRecord Models and Rails",
      "ActiveRecord Models and Rails Lab",
      "Intro to REST",
      "RESTful Action Index Lab",
      "Rails Dynamic Request",
      "Rails Dynamic Request Lab",
      "Rails URL Helpers",
      "Rails URL Helpers Lab",
      "Rails form_tag",
      "Rails form_tag Lab"
    ]
  
    def self.class_name
      self.distinct.pluck(:name)
    end
  
    def student_username=(username)
      self.student = Student.find(or_create_by(username: username))
    end
  
    def student_username
      self.student ? self.student.username : nil
    end
  end
  