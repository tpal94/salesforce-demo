class ProductsController < ApplicationController
  def show
    @products = salesforce.query("select * from Product2 limit 5")
  end
end
