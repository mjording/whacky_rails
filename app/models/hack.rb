#class Hack < ActiveRecord::Base
  #include ActiveModelDnode
  #belongs_to :hacker


   #def self.nodemethod(name)
     #result = DNode.new({ :f => proc { |x,cb| cb.call(x + 8810) }}).listen(5050)
        ##remote.f(5050, proc { |x| ford.call(x) })
      ##end
   #end
#end


class Hack < ActiveRecord::Base
  include ActiveModelDnoded
  belongs_to :hacker
  attr_accessor :nodectl, :nodemethodname
  def self.nodemethod(name)
    define_method(name) do
      @nodemethodname = Proc.new {|name,due| ["get_#{name}_name", "get_#{name}_due"] }
    end
    result = @nodectl.call @nodemethodname

    after_initialize
      @nodectl = nodecall
    end
end
