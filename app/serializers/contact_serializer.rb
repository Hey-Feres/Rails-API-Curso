class ContactSerializer < ActiveModel::Serializer
	# Associations
	belongs_to :kind, optional: true do
		link(:related) { contact_kind_url(object.id) }
	end
	
	has_many :phones, dependent: :destroy do
		link(:related) { contact_phones_url(object.id) }
	end
	
	has_one :address, dependent: :destroy do
		link(:related) { contact_address_url(object.id) }
	end

	attributes :id, :name, :email, :birthdate #, :author

	# HATEOAS - Lembrar de Aprofundar Aqui
	# link(:self) { contact_url(object.id) }
	# link(:kind) { kind_url(object.kind.id) }

	# def author # Atributo Virtual
	# 	"Bruno"
	# end

	meta do
		{ author: "Bruno" }
	end

	def attributes *args
		s = super *args
		# s[:birthdate] = I18n.l object.birthdate unless object.birthdate.blank?
		s[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
		s
	end
end
