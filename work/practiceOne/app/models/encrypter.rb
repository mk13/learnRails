require "rubygems"
require "active_record"

class Encrypter
	#Pass list of attributes that
	#need to be encrypted or decrypted
	def initialize(attrs_to_manage)
		@attrs_to_manage = attrs_to_manage
	end
	
	#before save, encrypt
	def before_save(model)
		@attrs_to_manage.each do
		|field|
			model[field].tr!("a-z", "b-za")
		end
	end
	
	#after save, decrypt
	def after_save(model)
		@attrs_to_manage.each do |field|
			model[field].tr!("b-za", "a-z")
		end
	end
	
	#do same for after find
	alias_method :after_find, :after_save
end

class ActiveRecord::Base
	def self.encrypt(*attr_names)
		encrypter = Encrypter.new(attr_names)
		
		before_save encrypter
		after_save encrypter
		after_find encrypter
		
		define_method(:after_find){}
	end
end