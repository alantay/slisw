# p true.class
# #=> TrueClass
# p false.class
# #=> FalseClass
# p "Ruby".class
# #=> String
# p 1.class
# #=> Integer
# p 2.3.class
# #=> Float
# p [1, 2, 3].class
# #=> Array
# h = {"name"=> "Alan", "age"=>"99"}
# p h.class
# #=> Hash
# p !!0

# p false && undefined_var
# #=> false
# p false and undefined_var
# #=> false
# p false & undefined_var
# #=> undefined local variable or method `undefined_var' for main:Object (NameError)
# p true || undefined_var
# #=> true
# p true or undefined_var
# #=> true
# p true | undefined_var
#=> undefined local variable or method `undefined_var' for main:Object (NameError)

p :alan
a = {}
a["la"]= "b"
MACHINE_STATE_ON = :MACHINE_STATE_ON
