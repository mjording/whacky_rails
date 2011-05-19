require 'dnode'

module Dnoded
  class Noded
    include ActiveModel::Conversion
    include ActiveModel::Observing
    include ActiveModel::Validations
    include ActiveModel::AttributeMethods
    include ActiveModel::Callbacks
    include ActiveModel::Dirty
    include ActiveModel::Serializers


    # 1) Define a class inheritable attribute named _attributes
    # Let's use underscore to mark this method as internal to our gem
    class_attribute :_attributes
    self._attributes = []
    #attr_reader :handler 


    
       
    def self.attributes(*names)
      attr_accessor *names
      define_attribute_methods names

      # 2) Add declared attributes to the list
      self._attributes += names
      
    end

    ## 3) Create the attributes hash by iterating the list
    def attributes
      self._attributes.inject({}) do |hash, attr|
        hash[attr.to_s] = send(attr)
        hash
      end
    end

    def nodecall(host="localhost", port="8820")
      Rack::Middleware::SessionInjector.propagate_session(request, "#{host}:#{port}", lifetime = nil)
    end 
      
    protected
    
    
    def clear_attribute(attribute)
      send("#{attribute}=", nil)
    end

    def attribute?(attribute)
      send(attribute).present?
    end

  end
end

