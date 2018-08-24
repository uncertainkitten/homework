class Map
  def initialize(map = nil)
    if map == nil
      @map = [[]]
    else
      @map = map
    end
  end

  def set(key, value)
    found = false

    if @map[0].empty? && @map.length <= 1
      @map[0] = [key, value]
    end

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

  def delete(key)
  end

  def show
  end
end
