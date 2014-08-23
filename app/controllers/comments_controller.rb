class CommentsController < ApplicationController

  http_basic_authenticate_with name: "sean", password: "farrell", only: :destroy

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.create(comment_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @comment = @project.comments.find(params[:id])
    @comment.destroy
    redirect_to project_path(@project)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end