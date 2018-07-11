class Person
	attr_reader :name

	def initialize (name)
		@name = name
	end

	def self.find(id)
		people = {1 => new('alice'), 2 => new('bob')}
		people.fetch(id) #to avoid nil, use fetch() instead of people[id]
	end
end

class SubscriptionsController
	def create(person_id)
		person = Person.find(person_id)
		Subscription.create_for_person(person)
	end
end

class Subscription
	def self.create_for_person(person)
		create!(:person => person, :person_name => person.name)
	end
	
	def self.create!(*args)
	end
end

SubscriptionsController.new.create(3)

