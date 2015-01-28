class Hash
  def hmap(&block)
    self.inject({}){|hash,(k,v)| hash.merge(block.call(k,v))}
  end
end

x = {"x" => 1, "y" => 2}
x.hmap{|k,v| {k.to_sym => v.to_s }}
puts x