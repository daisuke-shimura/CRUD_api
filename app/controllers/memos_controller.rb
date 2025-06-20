class MemosController < ApplicationController
  def show
    memo = Memo.find_by(id: params[:id])
    if memo
      render json: { 
        id: memo.id,
        title: memo.title, 
        content: memo.content, 
        created_at: memo.created_at, 
        updated_at: memo.updated_at,
        }
    else
      render json: { status: 404, message: "Not Found"}, status: 404
    end
  end

  def new
  end

  def edit
  end

  def create
    memo = Meoo.find(params[:id])
    memo.save!
    render :show
  end

  def update
  end

  def destroy
  end
end
