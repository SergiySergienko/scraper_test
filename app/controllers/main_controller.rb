class MainController < ApplicationController
  def index
    @product = Product.new
  end
end
