class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.new
    @diarios = Post.find_by_sql("select * from posts order by created_at DESC ")
  end
  def comunidad
    @users= User.all

  end

end
