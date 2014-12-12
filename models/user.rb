class User < ActiveRecord::Base
	validates_presence_of :email
	validates_presence_of :password
	
	has_one :gift
	has_one :secret_santee, class_name: "User", foreign_key: "secret_santee_id"
	belongs_to :secret_santa, class_name: "User", foreign_key: "secret_santa_id"
end