class PostsController < ApplicationController
#Fuckin rails couldn't understand korean -_ -
#GET /posts
#posts_path  
  def index
    @posts = Post.where("category_id =?", get_category_id('agenda'))
  end
#GET /posts/agenda
#agenda_posts
  def agenda
    
    @posts = Post.where("category_id =?", get_category_id('agenda'))
  end
#GET /posts/free
#agenda_posts  
  def free
    @posts = Post.where("category_id =?", get_category_id('free'))
  end
#GET /posts/brainstorm
#brainstorm_posts
  def brainstorm
    @posts = Post.where("category_id =?", get_category_id('brainstorm'))
  end
  
  def report
    @posts = Post.where("category_id =?", get_category_id('report'))
  end

#GET /posts/new
#new_post_path  
  def new
    @post = Post.new
    @categories = Category.all
  end
  
#POST /posts
#posts_path
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_path(@post.category)
    else
      render :action => "new"
    end
  end

#GET /posts/1
#post_path(id)
  def show
    @post = Post.find(params[:id])
  end

#GET /posts/1/edit
#post_path(id)
  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

#PUT /posts/1
#post_path(id)
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_path(@post.category)       
    else
      render edit_post_path(@post)
    end
  end 
  
#DELETE /post/1
#post_path
  def destroy
    @post = Post.find(params[:id])
    user = User.find(session[:user_id])
    category = @post.category
    if @post.author == user.name || user.name == 'admin'
      @post.destroy
      redirect_path(category)      
    else
      flash[:notice] = "Author of this post can delete this"
      redirect_path(category)
    end
  end
  
  private
  def get_category_id(category_name)
    category_name_id = Hash["agenda" => 10, "free" => 11, "brainstorm" => 12, "report" =>13 ]
    category_name_id[category_name]
  end
  
  def redirect_path(category)
    case category.id
        when 10 then redirect_to agenda_posts_path
        when 11 then redirect_to free_posts_path
        when 12 then redirect_to brainstorm_posts_path
        when 13 then redirect_to report_posts_path
        else redirect_to posts_path
    end     
  end
end
