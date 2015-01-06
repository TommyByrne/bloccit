class CommentsController < ApplicationController

def create
  @topic = Topic.find( params[:topic_id] )
  @post = @topic.posts.find( params[:post_id] )
  @comments = @post.comments

  @comment = current_user.comments.build(comment_params)
  @comment.post = @post
  @new_comment = Comment.new
end

  if @comment.save
    flash[:notice] = "Comment was Created Successfully."
  else
    flash[:error] = "There was an error saving the comment. Please try again."
  end


private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
