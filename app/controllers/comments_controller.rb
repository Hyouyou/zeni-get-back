class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
  	post = Post.find(params[:post_id])
  	@comment = current_user.comments.new(comment_params)
  	@comment.post_id = post.id
  	if @comment.save
      flash[:notice]= "質問を受け付けました！"
  	   redirect_to post_path(post.id)
    else
      @post = Post.find(params[:post_id])
      flash.now[:alert] = "質問を削除しました"
      render template: 'posts/show'
    end
  end

  def destroy
  	Comment.find(params[:id]).destroy
  	redirect_to user_path(current_user)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
