class LRUCache
  def initialize(cache_size)
    @cache_size = cache_size
    @cache = []
  end

  def count
    @cache.size
  end

  def add(el)
    if @cache.include?(el)
      newify(el)
      return show
    elsif is_full?
      @cache.shift
    end

    @cache.push(el)
  end

  def show
    @cache.dup
  end

  private
  def is_full?
    return true if count >= @cache_size
    false
  end

  def newify(el)
    shift = @cache.find_index(el)
    @cache[count-1], @cache[shift] = @cache[shift], @cache[count-1]
  end
end
