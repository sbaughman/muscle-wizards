class StaticPagesController < ApplicationController

  def home
    @no_nav = true
  end

  def about
  end
end
