class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
      #redirect_to('/posts/index')
      #redirect_to action 'index'
      @post = Post.new(content: params[:content])
      if @post.save
        redirect_to controller: 'posts', action: 'index'
        flash[:notice] = "投稿しました"
      else
        render("posts/new")
        flash[:notice] = "投稿に失敗しました。"
      end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]

    if @post.save
      redirect_to controller:'posts', action: 'index'
      flash[:notice] = "投稿を保存しました。"
    else
      render('/posts/edit')
      flash[:notice] = "投稿を失敗しました。"
    end
  end

  def destroy
    @post = Post.find_by(id:params[:id])
    @post.destroy
    @post.save
    redirect_to controller:'posts', action: 'index'
    flash[:notice] = "投稿を削除しました。"
  end
end
