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

  end

  def delete(key)
  end

  def show
  end
end
