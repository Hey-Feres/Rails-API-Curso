class Kind < ApplicationRecord
	has_many :contacts, dependent: :destroy
	def as_json options={}
		super(methods: :author, root: true)
	end	
end
