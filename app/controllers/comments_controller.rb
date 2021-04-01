class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/plans/#{comment.plan.id}" 
  end

  private
  def comment_params
    params.require(:comment).permit(:com).merge(user_id: current_user.id, plan_id: params[:plan_id])
  end
end
