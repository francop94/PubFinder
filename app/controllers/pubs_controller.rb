class PubsController < ApplicationController
	before_action :logged_in_user, only:[:create, :index, :update, :destroy, :edit]
  before_action :admin_user,     only: :destroy

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
    # $pub = Pub.find(params[:id])
    @pub = Pub.find(params[:id])
    @micropost = current_user.microposts.build if logged_in?
    @review = current_user.reviews.build if logged_in?
    @microposts = @pub.microposts.paginate(page: params[:page], :per_page => 15)
    @reviews = @pub.reviews.paginate(page: params[:page], :per_page => 15)


  end

    def destroy
    Pub.find(params[:id]).destroy
    flash[:success] = "Pub deleted"
    redirect_to root_url
  end

  def index
    @pubs = Pub.all.paginate(page: params[:page], :per_page => 15)
  end

  def edit 
    @pub = Pub.find(params[:id])
  end

  def update
    @pub = Pub.find(params[:id])
    if @pub.update_attributes(pub_params)
      flash[:success] = "Pub updated"
      redirect_to @pub
    else
      render 'edit'
    end
  end


  def favorite
    @pub = Pub.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @pub
      flash[:success] = "You favorited " + @pub.name
      redirect_to :back

    elsif type == "unfavorite"
      current_user.favorites.delete(@pub)
      flash[:success] = "You unfavorited " + @pub.name
      redirect_to :back

    else
      # Type missing, nothing happens
      flash[:success] = "Nothing happened"
      redirect_to :back
    end
  end

    private

  	def pub_params
      params.require(:pub).permit(:name, :address)  
  	end
end
