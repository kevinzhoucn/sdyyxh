# encoding: utf-8
class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!

  private
    def authenticate_admin!
#      redirect_to root_url unless current_user.admin?
    end
end