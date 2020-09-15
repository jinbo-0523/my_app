class MemosController < ApplicationController
  def index
    # @memos = Memo.all
  end

  def new
    memo = Memo.new
  end

  def create
    Memo.create!(memo_params)
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    memo = Memo.find(params[:id])
    memo.update!(memo_params)
  end

  def destroy
    memo = Memo.find(memo_params)
    memo.destroy!
  end

  private
  def mome_params
    params.require(:memo).permit(:title, :content, :image)
  end

end