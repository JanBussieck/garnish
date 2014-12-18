require_relative 'decorator'

module Garnish
	module Base


		def decorate(model)
			unless decorated?(model)
				helpers = view_context
				model.instance_eval do 
					extend Decorator.for(model, helpers)
				end
			end
		end

		private

		def	decorated?(model)

			eigenclass = model.instance_eval do 
				class << self
					self
				end
			end

			eigenclass.ancestors.map(&:to_s).include?(decorator_for(model))
		end

		def decorator_for(model)
			model.class.name + "Decorator"
		end
	end
end