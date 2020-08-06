class DynamicPagesController < ApplicationController
  def welcome
    params[:user] = User.find(params[:id])
  end
end
