class Friend
	@@myname = "Fred"
	attr_accessor :name
	def initialize(name, sex, phone)
		@name, @sex, @phone = name, sex, phone
	end
	
	def hello
		puts "Hi, I'm #{@name}."
	end
	
	def Friend.our_common_friend
		puts "We are all friends of #{@@myname}."
	end
	
end

paul = Friend.new("Paul", "Male", 7034751591)
puts paul.name
puts ARGV[0]