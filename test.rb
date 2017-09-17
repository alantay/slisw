# arr = Array(1..16)
# arr.each do|n|
#   if(n%4==1)
#     puts "#{arr[n-1..n+2]}"
#   end
# end

class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    if name.class == Hash then
      children = toArr(name.values)
      name = name.keys[0]
     
      puts children
    end

    @children = children
    @node_name = name
  end

  def toArr(n)
      puts n.first
      puts n
      # n.values[0] == nil
  end

  def visit_all(&block)
    visit &block
    children.each{|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

# ruby_tree = Tree.new(
#   "RUBY", [Tree.new("boom"), Tree.new("ban")]
# )

ruby_tree = Tree.new({"boom"=>{
  # "das" =>{}, "aa" => {}

}})

# ruby_tree.visit_all {|n| puts n.node_name}
