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
  end

  def peek
  end
end
