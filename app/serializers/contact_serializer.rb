class ContactSerializer < ActiveModel::Serializer
	# Associations
	belongs_to :kind, optional: true do 
		# link(:kind) { kind_url(object.kind.id) }
		link(:related) { kind_url(object.kind.id) }
	end
	has_many :phones, dependent: :destroy
	has_one :address, dependent: :destroy

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
