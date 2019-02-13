class StudentSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :email, :first_name, :last_name, :admin, :name, :provider, :uid, :oauth_token, :oauth_expires_at
  has_many :courses
  has_many :comments
end
