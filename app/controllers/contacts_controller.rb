class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :salesforce

  def show
    @contacts = salesforce.query("select Title, Email, Phone from Contact limit 5")
  end

 
end