class AddressSerializer < ActiveModel::Serializer
	attributes :id, :street, :city
	
	# Associations
	belongs_to :contact, optional: true do
		link(:related) { contact_address_url(object.id) }
	end
end
