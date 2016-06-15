valid_files = Dir["#{File.dirname(__FILE__)}/*/*"].reject { |f| File.directory?(f) }
valid_files.each { |f| require f }

module Heap
  # Your code goes here...
end
