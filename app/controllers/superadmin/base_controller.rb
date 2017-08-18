class Superadmin::BaseController < ApplicationController
  before_action :authorize_for_superadmins
  before_action :logged_in_user
  
  layout 'superadmin'
end
