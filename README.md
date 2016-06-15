# Heap
Implementation of a binary heap with heapsort.

## Installation
Not launched like a gem yet.

## Usage
Instantiate informing as parameter the operator to say if is a min-heap (:<) or max-heap (:>):

```ruby
heap = Heap.new(:>)
```

Insert like an array:

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
After checking out the repo, run bin/setup to install dependencies. Then, run bin/console for an interactive prompt that will allow you to experiment.

## Contributing
1. Fork it ( https://github.com/[my-github-username]/heap/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
