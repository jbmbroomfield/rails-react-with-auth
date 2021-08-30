class User < ApplicationRecord
	include Clearance::User

	def email_optional?
		true
	end

	def self.authenticate(username, password)
		if user = User.find_by(username: username) #find_by_normalized_email(email)
			if password.present? && user.authenticated?(password)
				user
			end
		else
			self.prevent_timing_attack
		end
	end

	DUMMY_PASSWORD = "*"

    def self.prevent_timing_attack
        new(password: DUMMY_PASSWORD)
        nil
    end
  
end
