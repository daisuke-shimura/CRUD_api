module Api
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
      memo = Memo.new(memo_params)
      if memo.save!
        render json: {memo: memo}, status: 201
      else
        pass
      end
    end

    def update
      memo = Memo.find(params[:id])
      if memo.update(memo_params)
        render json: {memo: memo}, status: 200
      else
        render json: { status: 404, message: "Not Found"}, status: 404
      end
    end

    def destroy

    end


    private
    def memo_params
      params.require(:memo).permit(:title, :content)
    end
  end
end