class PlansController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    if user_signed_in?
      @plans = Plan.includes(:user).where(user_id: current_user.id).page(params[:page])
      @genres = Genre.includes(:user).where(user_id: current_user.id)
      @genre_name = Array.new(@genres.size, 0)
    else
      @plans = Plan.where(user_id: 0)
      @genres = Genre.where(user_id: 0)
    end
  end

  def get_genre_name(id)
    genre = @genres.find{|array| array[:id] == id }
    genre.name    
  end

  helper_method :get_genre_name

  def new
    @plan = Plan.new
    @select_genre = Genre.where(user_id: current_user)
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    if @plan.save
      flash[:notice] = "目標を投稿しました"
      redirect_to action: 'index'
    else
      flash.now[:alert] = "投稿に失敗しました"
      @select_genre = Genre.where(user_id: current_user)
      render :new
    end
  end

  def edit
    @plan = Plan.find(params[:id])
    @select_genre = Genre.where(user_id: current_user)
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      flash[:notice] = "目標を修正しました"
      redirect_to action: 'index'
    else
      flash.now[:alert] = "修正に失敗しました"
      @select_genre = Genre.where(user_id: current_user)
      render :edit
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    if plan.errors.any?
      flash[:notice] = plan.errors.full_messages.first
    else
      flash[:notice] = "目標を削除しました"
    end
    redirect_to action: 'index'
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :genre_id, :deadline, :status)
  end
end
