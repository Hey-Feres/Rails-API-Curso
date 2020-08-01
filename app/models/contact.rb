class Contact < ApplicationRecord
	
	belongs_to :kind, optional: true
	
	has_many :phones, dependent: :destroy

	has_one :address, dependent: :destroy

	accepts_nested_attributes_for :phones,  allow_destroy: true
	accepts_nested_attributes_for :address, allow_destroy: true

	def as_json options={}
		s = super(options)
		s[:birthdate] = I18n.l self.birthdate unless self.birthdate.blank?
		s
	end
end
