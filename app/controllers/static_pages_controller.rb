class StaticPagesController < ApplicationController
  def home
  	@metricconfig = current_user.metricconfigs.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
