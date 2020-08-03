class ApplicationController < ActionController::API
	include DeviseTokenAuth::Concerns::SetUserByToken
	
	# include ActionController::HttpAuthentication::Token::ControllerMethods

	before_action :ensure_json_request
	# before_action :authenticate
	# before_action :authenticate_user!

	# HMAC_SECRET = 'my$ecretK3y'

	def ensure_json_request
		return if request.headers["Accept"] =~ /vnd\.api\+json/
		render json: "Unpermitted Header", status: 406
	end

	# def authenticate
	# 	authenticate_or_request_with_http_token do |token, options|
	# 		decoded_token = JWT.decode token, HMAC_SECRET, true, { algorithm: 'HS256' }
	# 	end
	# end
end
