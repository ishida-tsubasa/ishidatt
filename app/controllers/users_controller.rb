class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password],)
    @user.save
    redirect_to("/users/#{@user.id}")
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if @user.save
      redirect_to ("/users/#{@user.id}")
      flash[:notice] = "投稿を保存しました。"
    else
      render("/users/edit")
      flash[:notice] = "投稿を失敗しました。"
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    @user.save
    redirect_to controller:'users', action:'index'

  end
end
