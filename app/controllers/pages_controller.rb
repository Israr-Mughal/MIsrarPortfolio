class PagesController < ApplicationController
  def home
  	@skill  = Skill.all
  end

  def about
  end

  def contact
  end
end
