class Api::V1::ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def show
    render json: @profile
  end

  def articles
    render json: @profile.articles
  end

  def comments
    render json: @profile.comments
  end

  private #****************************** Private ******************************#
  
  def set_profile
    @profile = current_user
  end
end