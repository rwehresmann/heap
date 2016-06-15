class BinaryHeap
    attr_reader :values, :order

    # Initialize heap (values) as an array and its order, who means max or min heap.
    def initialize(order = :>)
      raise ArgumentError, "Invalid operator! Set order = :< " \
            " if you want a min_heap or :> for a max_heap" if ![:<, :>].include?(order)
      @order = order
      @values = []
    end

    # Insert an element at the last position, and sort the subtree starting from it.
    def push(element)
      @values << element
      heapfy_bottom_up(@values.length - 1)
    end
    alias_method :<<, :push

    # Delete an element, where this element it'll be always the root, and replace it with the
    # last element in the subtree, sorting the subtree starting from the root.
    def delete
      @values.shift
      if @values.length > 0
        @values.unshift(@values.pop)
        @values = Heap.heapfy_top_down(@values, 0, @order)
      end
    end

    # Sort a heap and reorganize it acording the order specified (ascending or descending).
    def self.heapsort!(array, order = :<)
      sorted_array = []
      loop do
        index = (array.length.fdiv(2)).floor - 1 # Start from an index where from him or backward, every index will have at least the left child (unless the array has only 1 element)
        Heap.swap(array, 0, array.length - 1)
        while index >= 0 do
          Heap.heapfy_top_down(array, index, order)
          index -= 1
        end
        sorted_array << array.shift
        break if array.length == 0
        array.insert(0, array.pop)
      end
      array = sorted_array
    end

    private

    # Swap two elements in the array
    def self.swap(array, index1, index2)
      array[index1], array[index2] = array[index2], array[index1]
    end

    # Method called after a deletion, sorting the tree from the root to the leaf.
    # It's a class method because it's used also in the heapsort method.
    def self.heapfy_top_down(array, parent_index, order)
      left_index = parent_index.zero? ? 1 : (parent_index + 1) * 2 - 1
      right_index = left_index + 1
      if left_index < array.length
        if right_index < array.length
          choosed_index = array[left_index].public_send(order, array[right_index]) ? left_index : right_index
        else
          choosed_index = left_index
        end
        Heap.swap(array, choosed_index, parent_index) if array[choosed_index].public_send(order, array[parent_index])
        heapfy_top_down(array, choosed_index, order)
      end
      array
    end

    # Method called after an insertion, who sorts the tree from the leaf to the root.
    def heapfy_bottom_up(index)
      if index != 0
        parent_index = index / 2
        if @values[index].public_send(@order, @values[parent_index])
          Heap.swap(@values, index, parent_index)
          heapfy_bottom_up(parent_index)
        end
      end
    end
end
