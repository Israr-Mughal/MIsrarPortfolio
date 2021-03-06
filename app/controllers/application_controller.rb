class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefultPageContent

  before_action :set_copyright

  def set_copyright
  	@copyright = IsrarViewTool::Renderer.copyright 'Israr Mughal', 'All rights reserved'
  end
end
