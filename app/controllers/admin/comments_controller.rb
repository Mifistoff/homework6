class Admin::CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
end
