class Gear
	attr_reader :chainrig, :cog, :wheel
	def initialize(chainrig, cog, wheel=nil)
		@chainrig = chainrig
		@cog 			= cog
		@wheel		= wheel
	end

	def ratio
		chainrig / cog.to_f
	end

	def gear_inches
		ratio * wheel.diameter
	end

end

class Wheel
	attr_reader :rim, :tire

	def initialize(rim, tire)
		@rim = rim
		@tire = tire
	end

	def diameter
		rim + (tire * 2)
	end

	def circumference
		diameter * Math::PI
	end

end


@wheel = Wheel.new(26, 1.5)
puts @wheel.circumference

puts Gear.new(52, 11, @wheel).gear_inches

puts Gear.new(52, 11).ratio