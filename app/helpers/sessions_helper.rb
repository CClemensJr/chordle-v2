module SessionsHelper
    def log_in(user)
        # Create a temporary cookie with the session method tied to the user id
        session[:user_id] = user.id
    end

    def current_user
        # Current_user equals current_user if it is not nil, otherwise it is assigned the value of the find_by method
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        # Return true if the current_user.nil? returns false
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    # Redirects to stored or default location
    def redirects_back_or_to(default_page)
        redirect_to (session[:forwarding_url] || default_page)
        session.delete(:forwarding_url)
    end

    # Stores the url to be accessed
    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end
end
