# Find out how to access files with and without code blocks. What is the benefit of the code block?
# with code block
File.open("dummyfile.txt","r").each do |line|
  puts line
end
puts "-----------------------------------"

# without code block
puts IO.read("dummyfile.txt")
puts "-----------------------------------"

# How would you translate a hash to an array? Can you translate arrays to hashes?
hash = {"a"=>"b", "c"=>"d"}
puts "hash #{hash}"
array = hash.values
puts "to array #{array}"
hash2 = Hash[*array]
puts "back to hash #{hash2}"

puts "-----------------------------------"
hash = {"a"=>"b", "c"=>"d"}
hash.each{ |key,val| puts "key: #{key}, val: #{val}"  }

puts "-----------------------------------"
k=0
arr16=[]
while k<16
  k = k+1
  arr16.push(k)
end

subarr = []
arr16.each do|v|
  subarr << v
  if subarr.length==4
    p subarr
    subarr = []
  end
end
puts "-----------------------------------"
arr16.each_slice(4){|v| p v}

puts "-----------------------------------"
class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    if name.class == Hash then
    
      children = toTree(name)
    end

    @children = children
    @node_name = name
  end

  def toTree(n)
    # puts n
    # puts n.keys
    treeChildren= n.values[0]
    treeArr = []

    if(treeChildren.size == 0)
      # base case
      return Tree.new(n.keys,[]);
    else
      treeChildren.each do |c|

        treeArr.push(toTree(c[1]))
      end
      # p treeArr
      return Tree.new(n.keys, treeArr)
    end
  end

  def visit_all(&block)
    visit &block
    children.each{|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

# ruby_tree = Tree.new("ruby",[Tree.new("reia"), Tree.new("boom")])
ruby_tree = Tree.new("grandpa"=>{"dad"=>{"child 1"=>{},"child 2"=>{}}, "uncle"=>{"cousin 1"=>{}, "cousin 2"=>{}}})

# puts "Visiting a node"
# ruby_tree.visit{|node| puts node.node_name}
# puts
#
# puts "Visiting entire tree"
# ruby_tree.visit_all{|node| puts node.node_name}
