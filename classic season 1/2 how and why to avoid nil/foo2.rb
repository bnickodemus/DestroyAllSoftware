class Person
	#attr_reader :subscription

	def subscribe #!
		#@subscription = Subscription.new
		Subscriber.new(Subscription.new)
	end

	#def subscription #localize the failure
	#	@subscription or raise NoSubscriptionError
	#end
end

class Subscriber
	attr_reader :subscription

	def initialize(subscription)
		@subscription = subscription
	end
end

class NoSubscriptionError < Exception
end

class Subscription
end

person = Person.new
if true #false
	#person.subscribe!
	subscriber = person.subscribe
	puts subscriber.subscription
end
#puts person.subscription

# use your language & libraries intelligently
# invert the object relationship
# guard against nils in a manual attribute reader
# introduce new domain concepts

