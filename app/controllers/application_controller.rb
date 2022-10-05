class ApplicationController < ActionController::Base
    def main
        if session[:login_uid] != nil then
            render "main"
        else
            render "login"
        end
        
    end
    def login 
        

        
        user = User.find_by(uid: params[:uid])
        pass = BCrypt::Password.new(user.pass)
        if pass == params[:pass]
            session[:login_uid] = user
            redirect_to root_path
    
            
        else
            render "error"
        end
            
        
    end
    
    def logout
        session.delete(:login_uid)
        
        render "login"
    end
end
