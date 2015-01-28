class BinaryNode
  attr_accessor :data, :visited

  def initialize(data)
    @data = data
    @visited = false
  end


end
class BinaryTree
  attr_accessor :root
  attr_reader :levels

  def initialize
    @root = nil
    @levels = 0
    @tree = Array.new
    @count = 0
  end

  def growTree
    newLen = 2**@levels - 1
    @tree.fill(nil,@tree.length...newLen)
  end

  def addNode(data)
    node = BinaryNode.new(data)
    if @count == @tree.length
      @levels += 1
      growTree()
    end
    @tree[@count] = node
    @count += 1
  end

  def getLeft
end