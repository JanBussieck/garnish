
module Decorator

    def self.for(model, view_context)

        decorator_name = model.class.name + "Decorator"
        decorator = const_get(decorator_name)

        decorator.module_eval do

            # dynamically define methods for associations in model and decorate them
            # lazily when mapping over them

            define_method(:helpers) { view_context }

            define_method(:undecorate) do
                model.dup
            end

            #override iteration methods
            alias model undecorate
        end

        decorator
    end

end
