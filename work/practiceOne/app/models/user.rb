require "encrypter"

class User < ActiveRecord::Base
	validates :name, :email, :screenname, presence: true, uniqueness: true
	
	#before_save -> encrypt
	#after_save, after_find -> decrypt
	encrypt(:name, :email)
end