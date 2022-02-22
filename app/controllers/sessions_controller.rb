class SessionsController < ApplicationController

    def new
    end

    def create
        entered_email=params["email"]
        entered_password=params["password"]
        
        # checking the email
        @user=User.find_by({email: entered_email})
        if @user # yes, email matches
            if BCrypt::Password.new(@user.password)==entered_password
                cookies["user_id"]=
                flash[:notice] = "Welcome!"
                redirect_to "/companies"
            else 
            #password doesn't maatch
                flash[:notice] = "Password is incorrect"
                redirect_to "sessions/new"
            end
        else
            flash[:notice] = "No user with that email address"
            redirect_to "/sessions/new"
        end
    end
end
