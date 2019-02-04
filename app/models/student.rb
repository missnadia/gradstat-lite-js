class Student < ApplicationRecord
    has_many :course_students
    has_many :courses, through: :course_students
    has_many :courses
    has_many :comments, through: :courses
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates_presence_of :username, :first_name, :last_name
  
    def full_name
      self.first_name + " " + self.last_name
    end
    
    def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |student|
        student.email = auth.info.email
        student.first_name = auth.info.name.split(" ")[0]
        student.last_name = auth.info.name.split(" ")[-1]
        student.username = auth.info.name.split(" ")[0][0].downcase + auth.info.name.split(" ")[-1].downcase
        student.password = "password"
        student.uid = auth.info.uid
        student.provider = auth.info.provider
        student.oauth_token = auth.credentials.token
        student.oauth_expires_at = Time.at(auth.credentials.expires_at)
        student.save!
      end
    end
  end  