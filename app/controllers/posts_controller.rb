class PostsController < ApplicationController
  def index
    # @posts = Post.all funciona pero deja desordenados los post una vez editados
    @posts = Post.order("updated_at DESC")
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.where(id: params[:id]).first
  end

  def create
    #TODO @post = Post.new(params[:post]) no se utiliza en estos casos, sino que requiere parametros "duros", desde el metodo privado
    @post = Post.new(post_params)
    #TODO binding.pry va a poner un "breackpoint" en esa linea de ejecucion y mostrarla en consola
    #binding.pry
    if @post.save
      redirect_to posts_path
    else
      # render the form again
    end
  end

  def edit
    @post = Post.where(id: params[:id]).first
  end

  def update
    @post = Post.where(id: params[:id]).first
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      # render the form again
    end
  end

  def destroy
    @post = Post.where(id: params[:id]).first
    if @post.destroy
      redirect_to posts_path
    else
      # render the form again
    end
  end

  private
  def post_params
    params.require(:post).permit(:ttile, :body, :tag_ids => [])
  end

end
