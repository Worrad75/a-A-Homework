class Map
    def initialize
        @map = []
    end

    def set(key, value)
        @map << [key, value]
    end

    def get(key)
        @map.each do |pair|
            if pair[0] = key
                return pair[1]
            else 
                return nil
            end
        end
    end

    def delete(key)
        @map.each_with_index do |pair, idx|
            if pair[0] == key 
                map.delete_at(idx)
                return self
            end
        end
        self
    end

    def show
        @map
    end
end
