class MemosController < ApplicationController
  def show
    memo = Memo.find_by(id: params[:id])
    if memo
      render json: { 
        "id"        : memo.id,
        "title"    : memo.title, 
        "content"  : memo.content, 
        "createdAt": memo.created_at, 
        "updatedAt": memo.updated_at 
        }
    else
      render json: { status: 404, message: "Not Found"}, status: 404
    end
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
