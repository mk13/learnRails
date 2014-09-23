require "encrypter"

class User < ActiveRecord::Base
	has_many :accounts
	validates :name, :email, :screenname, presence: true, uniqueness: true
	
	#before_save -> encrypt
	#after_save, after_find -> decrypt
	encrypt(:name, :email)
end