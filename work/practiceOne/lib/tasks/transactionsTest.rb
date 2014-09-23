require File.expand_path('../../../config/environment', __FILE__)

Account.delete_all

peter = Account.create(user_id: User.find_by_screenname("spiderman").id, balance: 100, account_number: "12345")
bob = Account.create(user_id: User.find_by_screenname("bobbob").id, balance: 200, account_number: "54321")

Account.transaction do 
	bob.deposit(10)
	peter.withdraw(10)
end

begin
	Account.transaction do
		bob.deposit(300)
		peter.withdraw(300)
	end
rescue
	puts "Transfer aborted"
	bob.reload
	peter.reload
	puts "Bob: #{bob.balance}"
	puts "Peter: #{peter.balance}"
end