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
 # DayOneの9/17にcreateじゃなくてsaveの理由を記載
    @memo = current_user.memos.new(memo_params)
    if @memo.save
    redirect_to root_path, notice: "投稿しました"
    else
    flash.now[:alert] = "投稿に失敗しました"
    render :new
    end
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def edit
  end

  def update
    if @memo.update(memo_params)
      redirect_to memo_path(@memo), notice: "更新しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :edit
    end
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