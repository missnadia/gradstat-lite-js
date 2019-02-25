class StudentSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :first_name, :last_name, :admin, :provider, :uid, :oauth_token, :oauth_expires_at
  has_many :courses
  has_many :comments
end
