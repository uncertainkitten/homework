class Map
  def initialize(map = nil)
    if map == nil
      @map = [[]]
    else
      @map = map
    end
  end

  def set(key, value)
    if if_empty?
      return @map[0] = [key,value]
    end

    found = false
    @map.each do |el|
      if el[0] == key
        el[1] = value
        found = true
        return value
      end
    end
    @map.push([key, value])
  end

  def get(key)
    @map.each do |el|
      if el[0] == key
        return el[1]
      end
    end

    return nil
  end

  def if_empty?
    if @map.empty? && @map.length <= 1
      @map[0] = []
      return true
    elsif @map[0].empty? && @map.length <= 1
      return true
    else
      return false
    end
  end

  def delete(key)
    return_val = nil
    @map.each_with_index do |el, idx|
      if el[0] == key
        return_val = @map.delete(@map[idx])
      end
    end

    if if_empty?
      return @map
    else
      return return_val
    end
  end

  def show
    puts "#{@map}"
  end
end
