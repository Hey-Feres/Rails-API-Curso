module ErrorSerializer
	def self.serialize(errors)
		return if errors.nil?
		json = {}
		json[:errors] = errors.to_hash.map do |k,v|
			v.map do |msg| 
				{ id: k, title: msg }
			end
		end.flatten
		json[:status] = :unprocessable_entity
		json
	end
end