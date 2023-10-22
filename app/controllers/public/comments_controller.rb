class Public::CommentsController < ApplicationController

  def create
   souvenir = Souvenir.find(params[:souvenir_id])
   comment = Comment.new(comment_params)
   comment.save
   redirect_to souvenir_path(souvenir)
  end

  def destroy
    souvenir = Souvenir.find(params[:souvenir_id])
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to souvenir_path(souvenir.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :souvenir_id, :customer_id)
  end

end
