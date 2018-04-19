class SessionsController < Devise::SessionsController 
	def create
		puts '+++++++++++++++++++++++++++++++++'
		if params[:user].blank?
        render(json: { errors: ['Missing user parameter.'] }, status: :unprocessable_entity) && return
    end
    @user = User.find_for_database_authentication(mobile_number: params[:user][:mobile_number])
    puts '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
    render(json: { errors: ["Invalid Phone or password"] }) && return if not_a_valid_login?
    puts '###########################################'
    # Tell warden that params authentication is allowed
    allow_params_authentication!
    @user = warden.authenticate!(scope: :user)

    sign_in @user, store: true
    render json: @user
	end

	private
		def not_a_valid_login?
      return true if @user.blank?
      return true if @user.valid_password?(params[:user][:password]) == false
      false
    end
end

