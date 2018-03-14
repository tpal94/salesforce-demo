class ProductsController < ApplicationController
  def show
    @products = salesforce.query("select name, id from Product2")
  end
end
