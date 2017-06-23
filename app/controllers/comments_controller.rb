class CommentsController < ApplicationController
  def index
    @comments = Comments.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
