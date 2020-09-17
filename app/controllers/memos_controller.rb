class MemosController < ApplicationController

  # index show以外はログイン画面のページをスキップできる
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :correct_user, only: %i[edit update destroy]


  def index
    @memos = Memo.includes(:user).order(:id)
  end

  def new
    @memo = Memo.new
  end

  def create
    current_user.memos.create!(memo_params)
    redirect_to root_path, notice: "投稿しました"
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def edit
  end

  def update
    @memo.update!(memo_params)
    redirect_to memo_path(@memo), notice: "更新しました"
  end

  def destroy
    @memo.destroy!
    redirect_to memos_path, alert: "削除しました"
  end

  private
  def memo_params
    params.require(:memo).permit(:title, :content, :image)
  end

  def correct_user
    @memo = current_user.memos.find_by(id: params[:id])
    redirect_to root_path if @memo.nil?
  end

end