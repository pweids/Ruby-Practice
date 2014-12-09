loop do
	print "Please enter a temperature and scale (C or F): "
	str = gets
	exit if str.nil? or str.empty?
	str.chomp!

	break if str.downcase == "exit"

	temp, scale = str.split(" ")

	if temp !~ /-?\d+/
		puts "#{temp} is not a valid number."
		next
	end

	temp = temp.to_f
	case scale
		when "C", "c"
			f = 1.8*temp + 32
		when "F", "f"
			c = (5.0/9.0)*(temp-32)
		else
			puts "Must specify C or F."
			next
	end

	if f.nil?
		print "#{c} degrees C\n"
	else
		print "#{f} degrees F\n"
	end
	f, c = nil
end