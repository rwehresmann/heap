# Heap
Implementation of a binary-heap and heapsort.

## Usage
Instantiate informing as parameter the operator to say if is a min-heap (:<) or max-heap (:>):

```ruby
heap = BinaryHeap.new(:>)
```

Insert like in an array:

```ruby
heap << 3
```

Delete the root:

```ruby
heap.delete
```

Call heapsort, informing as parameters an array to sort and the sort order like an operator:

```ruby
Heap.heapsort!([1,3,2,13,4,2,23,11,1,1,87,46], :<)
```

## Development
Run `bin/console` or, alternatively, `bundle console` for an interactive prompt that will allow you to experiment.
