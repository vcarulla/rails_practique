class CommentsController < ApplicationController
  def create
    @post = Post.where(id: params[:post_id]).first
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      # redirect_to
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
