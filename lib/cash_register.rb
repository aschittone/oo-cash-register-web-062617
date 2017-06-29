# require 'pry'

class CashRegister 
	attr_accessor :total, :discount, :items, :last_item

	def initialize(employee_discount=0)
		@discount = employee_discount
		@total = 0
		@items = []
	end

	def add_item(title, price, quantity=1)
		self.total += price * quantity
		num_items_to_add = quantity
		num_items_to_add.times do
			self.items << title
		end
		self.last_item = price * quantity
	end

	def apply_discount
		# binding.pry
		if self.discount == 0
			return "There is no discount to apply."
		else
			discount_amount = (100 - self.discount.to_f) / 100
			self.total = self.total * discount_amount
			return "After the discount, the total comes to $#{self.total.to_i}."
		end
	end

	def void_last_transaction
		self.total = self.total - self.last_item
	end
end

# CashRegister.new(-200)