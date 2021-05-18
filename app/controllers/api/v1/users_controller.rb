module Api
	module V1
		class UsersController < ApplicationController
			def index
				@users = User.all
				render json: { 'success': true,
																		'message': 'Founded data',
																		'data': {
												'users': @users
											}
}
			end

			def show
				@user = User.find( params[ :id ] )
				render json: { 'success': true,
																		'message': 'User founded',
																		'data': {
						'user': @user
					}
}
			rescue ActiveRecord::RecordNotFound => error
					render json: { 'success': false,
																			'message': error
}
			end

			def create
				@user = User.new( user_params )
				if @user.save
					render json: { 'success': true,
																			'message': 'User created',
																			'data': {
													'user': @user
												}
}
				else
					render json: { "success": false,
																			"message": 'Invalid email or password',
																			"data": {}
}
				end
			end

			def update
				@user = User.find( params[ :id ] )
				@user.update( user_params )
				if @user.save
					render json: { 'success': true,
																			'message': 'User updated',
																			'data': {
													'user': @user
												}
}
				else
					render json: { 'success': false,
																			'message': 'Something goes wrong'
}
				end
			rescue ActiveRecord::RecordNotFound => error
					render json: { 'success': false,
																			'message': error
}
			end

			def destroy
				@user = User.find( params[ :id ] )
				@user.destroy
				render json: { 'success': true,
																		'message': 'User seccesfully deleted'
}
			rescue ActiveRecord::RecordNotFound => error
						render json: { 'success': false,
																				'message': error
}
			end

			def login
				@user = User.find_by_email( params[ :email ] ).authenticate( params[ :password ] )
				if @user
					render json: { 'status': 'sucsess' }
				else
					render json: { 'errored': 'error' }
				end
			rescue ActiveRecord::RecordNotFound => error
					render json: { 'success': false,
																			'message': error
}
			end

			private

			def user_params
				params.permit( :name, :email, :password )
			end
		end
	end
end
