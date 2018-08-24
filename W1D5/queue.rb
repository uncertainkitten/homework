class Queue
  def initialize(queue= nil)
    if queue == nil
      @queue = []
    else
      @queue = queue
    end
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def peek
    @queue[-1]
  end
end
