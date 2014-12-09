=begin
the problem with the below is that diameters has to implicitly know
where the rim and tire size is and how the data structure is organized.
Futhermore, we are not being "DRY" when we have to repeat the array
reference to access our rim and tire
"It depends upon the array's structure. If that structure changes, then this
code must change. When you have data in an array it's not long before you have
references to the array structure all over. The references are /leaky/. They
escape encapsulation and insinuate themselves throughout the code. They are not
DRY. The knowledge that rims are at [0] shoudl not be duplicated; it should be
known in just one palce" p. 27 POODR
=end
class ObscuringReferences
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def diameters
    # 0 is a rim, 1 is a tire
    data.collect {|cell|
      cell[0] + (cell[1] * 2)}
  end
  #many other methods
end

=begin
The below is the corrected version with a struct
=end
class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect{|wheel| diameter(wheel)}
  end

  # now we can take the diameter of ONE wheel
  def diameter(wheel)
    wheel.rim + (wheel.tire *2)
  end

  # ... now everyone can send rim/tire to wheel

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect{|cell|
      Wheel.new(cell[0], cell[1])}
  end
end