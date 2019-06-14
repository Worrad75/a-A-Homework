class Queue
    def initialize
        @queue = Array.new
    end

    def enqueue(el)
        @queue.unshift(el)
        self
    end

    def dequeue
        @queue.pop
        self
    end

    def peek
        @queue[-1]
    end
end
