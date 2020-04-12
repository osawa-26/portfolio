class RecordsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user,  only: [:show,:edit,:update,:destroy]

  def index
      @records = current_user.records.order(id: :desc).page(params[:page]).per(3)
  end
  
  def new
    @record = Record.new
  end

  def create
    @record = current_user.records.build(record_params)
    if @record.save(record_params)
      flash[:success] = '正常に入力されました'
      redirect_to root_url
    else
      flash.now[:danger] = '正常に入力されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @record.update(record_params)
      flash[:success] = '正常に入力されました'
      redirect_to @record
    else
      flash.now[:danger] = '正常に入力されませんでした'
      render :edit
    end
  end

  def destroy
      @record.destroy
      flash[:success] = "削除されました"
    redirect_to @record
  end

  private

  def record_params
    params.require(:record).permit(:material, :study_time, :memo)
  end

  def correct_user
    @record = current_user.records.find_by(id: params[:id])
    unless @record
      redirect_to root_url
    end
  end
end