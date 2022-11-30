class User < ApplicationRecord
  rolify :before_add => :before_add_method
    def before_add_method(role)
      "this is method call by rolify"
  end
end