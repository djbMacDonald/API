class CommentsController < ApplicationController
  def index
    @comments = Tournament.find(params[:tournament_id]).comments
    render json: @comments, status: 200
  end

  def create
    @comment = Tournament.find(params[:tournament_id]).comments.new(new_comment_params)
    if @comment.save
      render json: @comment, status: 201
    else
      render json: @comment.errors,
      status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(edit_comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors,
      status: :unprocessable_entity
    end
  end

  private

  def new_comment_params
    params.require(:comment).permit(:body, :tournament_id, :user_id)
  end

  def edit_comment_params
    params.require(:comment).permit(:subcomment)
  end
end
