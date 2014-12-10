class Gear
	attr_reader :chainrig, :cog, :wheel
	def initialize(args)
		@chainrig = args.fetch(:chainrig, 40)
		@cog 			= args.fetch(:cog, 18)
		@wheel		= args[:wheel]
	end

	def ratio
		chainrig / cog.to_f
	end

	def gear_inches
		ratio * diameter
	end

	def diameter
		wheel.diameter
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