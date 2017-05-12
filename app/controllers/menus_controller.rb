class MenusController < ApplicationController

 def index
  @menus = Menu.order('created_at')
 end

 def new
  @menu = Menu.new
  @pub = Pub.find(params[:pub_id])

 end


 def create
  @menu = Menu.new(menu_params)
  if @menu.save
   flash[:success] = "Successfully added new menu!"
   redirect_to root_path
  else
   flash[:alert] = "Error adding new menu!"
   render :new
  end
 end

 def destroy
  @menu = Menu.find(params[:id])
    if @menu.destroy
      flash[:success] = "Successfully deleted menu!"
      redirect_to root_path
    else
      flash[:alert] = "Error deleting menu!"
    end
  end

 private

 #Permitted parameters when creating a photo. This is used for security reasons.
 def menu_params
  params.require(:menu).permit(:title, :document)
 end

end
