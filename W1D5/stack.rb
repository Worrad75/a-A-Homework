class Stack
    def initialize
      @stack = Array.new
    end

    def push(el)
      @stack.push(el)
      self
    end

    def pop
      @stack.pop
      self
    end

    def peek
      @stack[-1]
    end
end
