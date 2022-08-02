class ItemsController < ApplicationController
  def index
    @supermarket = Supermarket.find(params[:supermarket_id])
    @items = Item.joins(:customers)
    .where("supermarket_id = ?", @supermarket.id).distinct
  end
end
