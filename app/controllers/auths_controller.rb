class AuthsController < ApplicationController
	
	# skip_before_action :authenticate
	
	# def create
	# 	payload = { name: params[:name], exp: Time.now.to_i + 30 }
	# 	token = JWT.encode payload, HMAC_SECRET, 'HS256'
	# 	render json: token
	# end
end
