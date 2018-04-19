class VerificationsController < ApplicationController

	def create

		Verification.delete_all
	  	verification_code =  1_000_000 + rand(10_000_000 - 1_000_000)
	 	Verification.create!(verification_code: verification_code)
	  
	  	@twilio_client = Twilio::REST::Client.new "ACe4b7de0d3408ea927b9c4b331c8a5c05", "d5ae85fbb4f68c3158c8b974c8a47833"
		@twilio_client.account.sms.messages.create(
		    :from => "+14695356410",
		    :to => "+923227071266",
		    :body => "Your verification code updated is #{verification_code}."
		)

	    render json: {message: "A verification code has been sent to your mobile. Please fill it in below.", status: :ok}
	end

	def verify

	@verification_code = Verification.first.verification_code

    if @verification_code and @verification_code == params[:verification_code]
      puts '.........................VERIFICATION PASS........................'
      @verification_code.destroy
      render json:{message: "Thank you for verifying your mobile number.", status: :ok}
		else
			puts '$$$$$$$$$$$$$$$ VERIFICATION FAILED!! $$$$$$$$$$$$$$$$$$$$$$'
			render json:{errors: "Invalid verification code."}
  	end
	end
end
