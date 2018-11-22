def describe(description, &block)
	ExampleGroup.new(block).evaluate!
end

class ExampleGroup
	def initialize(block)
		@block = block
	end

	def evaluate!
		instance_eval(&@block)
	end

	def it(descript, &block)
		block.call
	end
end


class Object
	def should
		DelayedAssertion.new(self)
	end
end


class DelayedAssertion
	def initialize(subject)
		@subject = subject
	end

	def ==(other)
		raise AssertionError unless @subject == other
	end
end


class AssertionError < Exception
end

