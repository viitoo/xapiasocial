class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.new
    @diarios = Post.find_by_sql("select posts.* from posts order by created_at DESC ")
  end

  def comunidad
    @users = User.all
  end


  def perfil
    @user = User.find(current_user.id)
    @posts = Post.find_by_sql("select posts.* from posts where posts.user_id=#{current_user.id} order by created_at DESC ")


  end
end
