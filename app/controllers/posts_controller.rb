class PostsController < ApplicationController

	before_filter :not_admins, :only => [:new, :create, :destroy]
	before_filter :not_privileges, :only => [:edit, :update]

  def index
  	@title = "Home"
    @posts = Post.find(:all, :order => "publishedDate DESC")
  end
  
  def new
    @post = Post.new
    @title = "Publicando una Nueva Noticia"
  end
  
  def create
    @post = Post.new(params[:post])
    @post.update_attribute(:publishedDate, Time.now)
    if @post.save
      flash[:notice] = "Noticia Publicada Satisfactoriamente."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    @title = "Editando Noticia"
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Noticia Editada Satisfactoriamente."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_url
  end
end
