class User < ActiveRecord::Base
    has_secure_password

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.valid?
          @user.save
          session[:user_id] = @user.id
          redirect_to '/'
        else
          redirect_to :signup
        end
    end
     
      private
     
      def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
      end
    
  end