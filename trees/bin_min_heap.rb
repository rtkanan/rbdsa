# Binary Heap - Minimum Heap

class BinMinHeap
    def initialize
        @heaplist = [nil]
    end

    def filter_up(size)
        while size / 2 > 0
            rem = size / 2
            if (@heaplist[size] < @heaplist[rem])
                @heaplist[size], @heaplist[rem] = @heaplist[rem], @heaplist[size]
            end
            size = rem
        end
    end

    def insert(key)
        @heaplist << key
        filter_up(@heaplist.size-1)
    end

    def show_heap
        puts @heaplist.inspect
    end
end

bh = BinMinHeap.new()
bh.insert(6)
bh.insert(5)
bh.insert(3)
bh.insert(2)
bh.insert(7)
bh.insert(1)
bh.show_heap