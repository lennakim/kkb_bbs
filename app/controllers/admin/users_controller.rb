class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: [:show, :edit, :update]
  def index
    @q = User.search(params[:q])
    if params[:q] != nil
      @users = @q.result  
    else
      if params[:group] == "black"
        @users = User.where(is_forbid: true).page(params[:page])  
      else
        @users = User.page(params[:page])  
      end
      
    end
  end

  def show
    @topics = @user.topics.page(params[:page])
    @comments = @user.comments.page(params[:page])
  end

  def new
    @user = User.new    
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to admin_user_path(@user)
    else
      render "new"
    end
  end


  def edit
    if @user.forbidden?
      @user.update(:is_forbid => false)  
    else
      @user.update(:is_forbid => true)  
    end
    if @user.save
      redirect_to admin_users_path
    else
      redirect_to admin_users_path
    end
  end

  def add_admin
    @admins = User.where(role: "admin")
  end

  def set_admin
    params.permit!
    @user = User.find_by(email: params[:email])
    if @user
      if @user.role == "admin"
        @user.update(role: "")
        redirect_to admin_user_add_admin_path
      else
        @user.update(role: "admin")
        redirect_to admin_user_add_admin_path
      end
    else
      redirect_to admin_user_add_admin_path
    end
    
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit!
  end
end
