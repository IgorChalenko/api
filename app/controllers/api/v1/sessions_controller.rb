module Api
	module V1
		class SessionsController < ApplicationController
      def create
				user = User.find_by_email( params[ :email ] )&.authenticate( params[ :password ] )
				if user
					session[:current_user_id] = user.id
          render json: {'success': true,
                                    'mesage': 'Session seccessfully created'}
				else
					render json: { 'errored': 'error' }
				end
			rescue ActiveRecord::RecordNotFound => error
					render json: { 'success': false,
																			 'message': error
}                             
			end
		end
	end
end
