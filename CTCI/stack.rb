class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class Stack
  @top = nil

  def push(data)
    node = Node.new(data)
    node.next = @top
    @top = node
    return @top
  end

  def pop
    if @top != nil
      data = @top.data
      @top = @top.next
      return data
    else return nil
    end
  end

  def peek
    return @top.data if @top != nil
    return nil
  end

end

class Queue
  @first = @last = nil

  def enqueue(data)
    if @first == nil
      @last = Node.new(data)
      @first = @last
    else
      @last.next = Node.new(data)
      @last = @last.next
    end
  end

  def dequeue
    return nil if @first == nil
    item = @first.data
    @first = @first.next
    last = nil if @first == nil
    return item
  end

  def peek
    return @first.data
  end

end

def hanoiStacks (disk, source, dest, spare)
  if disk == 0
    dest.push(source.pop) 
  else
    hanoiStacks(disk-1,source,spare,dest)
    dest.push(source.pop)
    hanoiStacks(disk-1,spare,dest,source)
  end
end

class Animal
  attr_reader :name, :time, :species
  def initialize(name,species,time)
    @name = name
    @species = species
    @time = time
  end
end

class Shelter

  def initialize()
    @dogQ  = Queue.new
    @catQ  = Queue.new
    @count = 0
  end

  def enqueue(name,species)
    @count += 1
    ani = Animal.new(name,species,@count)
    if species == "dog"
      @dogQ.enqueue(ani)
    elsif species == "cat"
      @catQ.enqueue(ani)
    else
      return nil
    end
  end

  def dequeueAny
    if @dogQ.peek().time < @catQ.peek().time
      return @dogQ.dequeue()
    else
      return @catQ.dequeue()
    end
  end

  def dequeueDog
    return @dogQ.dequeue
  end

  def dequeueCat
    return @catQ.dequeue
  end
end


animalHaven = Shelter.new

animalHaven.enqueue("Cleo", "cat")
animalHaven.enqueue("Palmer", "dog")
p animalHaven.dequeueDog
p animalHaven.dequeueAny