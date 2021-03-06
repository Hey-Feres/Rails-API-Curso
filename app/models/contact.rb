class Contact < ApplicationRecord
	# Associations
	belongs_to :kind, optional: true
	has_many :phones, dependent: :destroy
	has_one :address, dependent: :destroy
	# Nested Attributes
	accepts_nested_attributes_for :phones,  allow_destroy: true
	accepts_nested_attributes_for :address, allow_destroy: true
	# Pagination
	paginates_per 10
	# Validations
	validates_presence_of :kind
	validates_presence_of :address
end
