class CitiesController < ApplicationController
  def show
    params[:city] = City.find(params[:id])
    @gossips = Gossip.joins(:user).
      where(:user => User.where(city_id: params[:id]))
  end
end
