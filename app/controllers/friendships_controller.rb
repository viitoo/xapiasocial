class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  def index
    @friendships = Friendship.all
  end

  def show
  end

  def new
    @friendship = Friendship.new
  end

  def edit
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to home_comunidad_path
    else
      flash[:error] = "Unable to add friend."
      redirect_to home_comunidad_path
    end
  end

  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to home_perfil_path, notice: 'Friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])

    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to home_perfil_path, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id)
    end
end
