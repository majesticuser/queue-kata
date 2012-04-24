module My

  class Queue

    def initialize
      @items = []
    end

    def empty?
      @items.empty?
    end

    def size
      @items.size
    end

    def remove
      return @items.delete_at(0) unless empty?
      raise UnderflowError
    end

    def add(item)
      @items << item
    end

    class UnderflowError < Exception
    end

  end

end