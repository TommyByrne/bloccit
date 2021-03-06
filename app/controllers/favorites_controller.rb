class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

    authorize favorite
    if favorite.save
      flash[:notice] = "Post was favorited"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error favoriting the Post. Please try again."
      redirect_to [@post.topic, @post]
    end
  end

 def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    favorite = current_user.favorites.find(params[:id])

    authorize favorite
    if favorite.destroy
      flash[:notice] = "Removed favorite."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Unable to remove favorite. Please try again."
      redirect_to [@post.topic, @post]
    end
  end
end
