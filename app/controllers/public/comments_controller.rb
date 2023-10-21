class Public::CommentsController < ApplicationController

  def create
    
  end

  def destroy
  end
  
  private

  def post_param
    params.require(:post).permit(:comment)
  end

end
