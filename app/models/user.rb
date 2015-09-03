class User < ActiveRecord::Base
	validates :name, presence: true, length: {maximum: 10}, uniqueness: true
	validates :email, presence: true, length: {maximum: 20}, uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: {minimum: 6}
end
