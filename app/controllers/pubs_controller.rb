class PubsController < ApplicationController
  def new
  	@pub = Pub.new
  end
end
