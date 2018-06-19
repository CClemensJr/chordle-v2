module SessionsHelper
    def log_in(user)
        # Create a temporary cookie with the session method tied to the user id
        session[:user_id] = user.id
    end
end
