class PubsController < ApplicationController
	before_action :logged_in_user, only:[:create, :index, :update, :destroy, :edit]
   # before_action :admin_user,     only: :destroy

  def new
  	@pub = Pub.new
  end

  def create
  	@pub = current_user.pubs.build(pub_params)
  	if @pub.save
  		flash[:success] = "Your pub was created!"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def show
    @pub = Pub.find(params[:id])
    @micropost = current_user.microposts.build if logged_in?
    @microposts = @pub.user.microposts.paginate(page: params[:page])


  end

    def destroy
    Pub.find(params[:id]).destroy
    flash[:success] = "Pub deleted"
    redirect_to root_url
  end

  def index
    @pubs = Pub.all
  end

    private

  	def pub_params
      params.require(:pub).permit(:name, :address)  
  	end
end
