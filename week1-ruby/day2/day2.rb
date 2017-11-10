# Find out how to access files with and without code blocks. What is the benefit of the code block?
# with code block
File.open('dummyfile.txt', 'r').each do |line|
  puts line
end
puts '-----------------------------------'

# without code block
puts IO.read('dummyfile.txt')
puts '-----------------------------------'

# How would you translate a hash to an array? Can you translate arrays to hashes?
hash = { 'a' => 'b', 'c' => 'd' }
puts "hash #{hash}"
array = hash.values
puts "to array #{array}"
hash2 = Hash[*array]
puts "back to hash #{hash2}"

puts '-----------------------------------'
hash = { 'a' => 'b', 'c' => 'd' }
hash.each { |key, val| puts "key: #{key}, val: #{val}" }

puts '-----------------------------------'
k = 0
arr16 = []
while k < 16
  k += 1
  arr16.push(k)
end

subarr = []
arr16.each do |v|
  subarr << v
  if subarr.length == 4
    p subarr
    subarr = []
  end
end
puts '-----------------------------------'
arr16.each_slice(4) { |v| p v }

puts '-----------------------------------'
class Tree
  attr_accessor :children, :node_name

  def initialize(name, children = [])
    if name.class == Hash
      children = toTree(name.values[0])
      name = name.keys[0]
    end
    @children = children
    @node_name = name
  end

  def toTree(n)
    if n.empty?
      []
    else
      treeArr = []
      n.each do |key, val|
        treeArr.push(Tree.new(key, toTree(val)))
      end
      treeArr
    end
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit
    yield self
  end
end

ruby_tree = Tree.new('grandpa' => { 'dad' => { 'child 1' => {}, 'child 2' => {} }, 'uncle' => { 'child 3' => {}, 'child 4' => {} } })

puts 'Visiting a node'
ruby_tree.visit { |node| puts node.node_name }
puts

puts 'Visiting entire tree'
ruby_tree.visit_all { |node| puts node.node_name }

puts '-----------------------------------'
File.foreach('dummyfile.txt').with_index do |line, lineNum|
  puts "Line#{lineNum}: #{line}" if line =~ /shark(.*)/
end
