class RegistrationsController < Devise::RegistrationsController
	def create
		puts '-----------------------------------------------------'
		@user = User.new(user_params)
		if @user.save
			puts '<<<<<<<<<<<<<<<<<<< USER CREATED <<<<<<<<<<<<<<<<<<<<<<<<'
			render json: @user, status: :created, location: @user
		else
			puts '>>>>>>>>>>>>>>>>>>>>> USER CREATION ERROR >>>>>>>>>>>>>>>>'
			puts @user.errors
			render json: @user.errors, status: :unprocessable_entity
		end
	end


	private
		def user_params
			params.require(:user).permit(:name,:password,:password_confirmation,:mobile_number)
		end
end
