class Stack
  def initialize(stack = nil)
    if stack == nil
      @stack = []
    else
      @stack = stack
    end
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack[-1]
  end
end
