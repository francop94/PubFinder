class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
  	@pub = Pub.find(params[:pub_id])
  	input = micropost_params.merge(pub: @pub)
    @micropost = current_user.microposts.build(input)
    #@micropost.pub_id= $pub.id
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to(:back)
    else
      render 'static_pages/home'
      print (@pub.nil?)
    end
  end

  def destroy
  end

    private

    def micropost_params
      params.require(:micropost).permit(:content, :pubs_id)
    end

end
