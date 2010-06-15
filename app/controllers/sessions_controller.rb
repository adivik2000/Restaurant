class SessionsController < AdminController
  skip_before_filter :login_required
  
  def new
    @title = "Sign in"
  end
  
  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil? 
      flash[:success] = "Your email/password combination is invalid"
      @title = "Sign in" 
    redirect_to signin_path
    else
      sign_in user
      redirect_to :controller => 'admin/users', :action => 'show', :id => user.id
    end 
  end  
  
  def destroy
    sign_out
    redirect_to signin_path
  end

end
