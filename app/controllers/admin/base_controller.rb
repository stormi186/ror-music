class Admin::BaseController < ApplicationController
  before_action :authorize_for_admins
  before_action :logged_in_user
  
  layout 'admin'
end
