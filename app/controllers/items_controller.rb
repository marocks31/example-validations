class ItemsController < ApplicationController

  def index
    items = Items.all
    render json: items.as_json
  end

  def create
    item = Item.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email]
    )

    item.save
    render json: item.as_json
  end

  def show
    item = Item.find_by(id: params[:id])
    render json: item.as_json
  end 

  def update
    item = Item.find_by(id: params[:id])
    item.first_name = params[:first_name] || item.first_name
    item.last_name = params[:last_name] || item.last_name
    item.email = params[:email] || item.email 

    item.save
    render json: item.as_json
  end 

  def destroy
    item = Item.find_by(id: params[:id])
    item.destroy 
    render json: {message: "not available"}
  end 
end
