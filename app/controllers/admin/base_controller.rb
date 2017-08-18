class Admin::BaseController < ApplicationController
	before_action :logged_in_user
  before_action :authorize_for_admins
  
  layout 'admin'
end
