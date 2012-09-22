class ControlPanelController < ApplicationController
  def index
    @settings = current_user.settings
  end
end
