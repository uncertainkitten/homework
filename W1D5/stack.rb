class Stack
  def initialize(stack)
    @stack = stack
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
  end
end
