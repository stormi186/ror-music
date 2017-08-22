class Superadmin::BaseController < ApplicationController
	before_action :logged_in_user
  before_action :authorize_for_superadmins
  
  layout 'superadmin'
end
