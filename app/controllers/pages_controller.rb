class PagesController < ApplicationController
  before_action :authenticate_user!
  def home_page
  end
end
