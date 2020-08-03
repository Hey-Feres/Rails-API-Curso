module V1
  class ContactsController < ApplicationController
    include ErrorSerializer

    before_action :set_contact, only: [:show, :update, :destroy]
    # before_action :authenticate_user!
    # GET /contacts
    def index
      # @contacts = Contact.all.page(params[:page][:number]).per(params[:page][:size])
      # @contacts = Contact.all.page(params[:page][:number])
      @contacts = Contact.all.page(params[:page].present? ? params[:page] : 1)
      # render json: @contacts.map{ |contact| contact.attributes.merge({ author: "Bruno" }) }
      # render json: @contacts, methods: :author
      # Pagination by Header
      # paginate json: @contacts, include: :kind
      render json: @contacts, include: :kind
    end

    # GET /contacts/1
    def show
      render json: @contact, include: [:kind] #, meta: { author: "Bruno Feres Villela" }
    end

    # POST /contacts
    def create
      @contact = Contact.new(contact_params)
      if @contact.save
        render json: @contact, include: [:kind, :phones, :address], status: :created, location: @contact
      else
        # render json: @contact.errors, status: :unprocessable_entity
        e = ErrorSerializer.serialize(@contact.errors)
        render json: e[:errors], status: e[:status]
      end
    end

    # PATCH/PUT /contacts/1
    def update
      if @contact.update(contact_params)
        render json: @contact, include: [:kind, :phones, :address]
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # DELETE /contacts/1
    def destroy
      @contact.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        @contact = Contact.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def contact_params
        # params.require(:contact).permit( 
        #   :name, :email, :birthdate, :kind_id, 
        #   phones_attributes: [ :id, :number, :_destroy ],
        #   address_attributes: [ :id, :street, :city, :_destroy ],
        # )
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
  end
end