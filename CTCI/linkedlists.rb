require 'set'

class Node
  attr_accessor :next, :data
  
  def initialize(data)
    @data = data
    @next = nil
  end

  def appendToTail(d)
    last = Node.new(d)
    n = self
    while n.next != nil do
      n = n.next
    end
    n.next = last
    return last
  end
end

def deleteNode(head,data)
  n = head
  if n.data == data
    return n.next
  end

  while n.next != nil do
    if n.next.data = data
      n.next = n.next.next
      return head
    end
    n = n.next
  end
end

#problem 1
def removeDupes(head)
  seen = Set.new [head.data]
  n = head
  while n.next != nil do
    data = n.next.data
    if seen.include? data
      n.next = n.next.next
    else 
      seen.add(data)
      n = n.next
    end
  end
end

def findKthElement(head, k)
  return nil if head == nil
  p1 = p2 = head
  (k-1).times do
    if p2.next == nil
      return nil
    end
    p2 = p2.next
  end
  while p2.next != nil
    p1 = p1.next
    p2 = p2.next
  end
  return p1
end

def findKthRecursive(head,k)
  return 0 if head == nil
  i = findKthRecursive(head.next,k) + 1
  if i == k
    puts head.data
  end
  return i
end

def deleteMiddleNode(node)
  n = node.next
  node.data = n.data
  node.next = n.next

end

def partition(node, data)
  n = node
  head = tail = Node.new(n.data)

  while n.next != nil
    tempNode = Node.new(n.next.data)
    if tempNode.data < data
      tempNode.next = head
      head = tempNode
    else
      tail.next = tempNode
      tail = tempNode
    end
    n = n.next
  end
  tail.next = nil
  return head
end

n = Node.new(1)
n2 = n.appendToTail(7).appendToTail(3).appendToTail(6)
n2.appendToTail(5).appendToTail(4).appendToTail(7).appendToTail(2)

newlist = partition(n,3)
p newlist