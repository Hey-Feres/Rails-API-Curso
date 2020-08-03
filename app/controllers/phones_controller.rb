class PhonesController < ApplicationController
	before_action :set_contact
	
	# GET /phones/1
  	def show
  		render json: @contact.phones
	end

	# POST contacts/:contact_id/phone
	def create
	    @contact.phones << Phone.new(phone_params)
	    if @contact.save
			render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
	    else
	      	render json: @contact.phones.errors, status: :unprocessable_entity
	    end
	end

	# PATCH/PUT contacts/:contact_id/phone
	def update
		@phone = Phone.find(phone_params[:id])
		if @phone.update(phone_params)
	    	render json: @contact.phones
	  	else
	    	render json: @contact.errors, status: :unprocessable_entity
	  	end
	end

	# DELETE contacts/:contact_id/phones
	def destroy
		phone = Phone.find(phone_params[:id])
		phone.destroy
	end
	
	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_contact
			@contact = Contact.find(params[:contact_id])
	    end
	    # Only allow a trusted parameter "white list" through.
	    def phone_params
	    	# params.require(:address).permit(:city, :street)
	    	ActiveModelSerializers::Deserialization.jsonapi_parse(params)
	    end	    
end
