class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit, :update]
  

  def create
  	@pub = Pub.find(params[:pub_id])
  	input = micropost_params.merge(pub: @pub)
        @micropost = current_user.microposts.build(input)
        #@micropost.pub_id= $pub.id
        if @micropost.save
      		flash[:success] = "Micropost created!"
      		redirect_to(:back)
        else
       		flash[:danger] = "Micropost's content can't be blank. Micropost was not created!"
      		redirect_to pub_path(@micropost.pub)
    	end
  end

    def destroy
    Micropost.find(params[:id]).destroy
    flash[:success] = "Micropost deleted"
    redirect_to(:back)
  end


    def edit 
    @micropost = Micropost.find(params[:id])

  end

  def update
    @micropost = Micropost.find(params[:id])
    
    if @micropost.update_attributes(micropost_params)
      flash[:success] = "Micropost updated"
      redirect_to pub_path(@micropost.pub)
    else
      flash[:danger] = "Micropost was not modified"
      redirect_to(:back)
    end
  end

    private

    def micropost_params
      params.require(:micropost).permit(:content, :pubs_id)
    end

end
