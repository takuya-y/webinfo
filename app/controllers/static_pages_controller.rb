class StaticPagesController < ApplicationController
  def index
    # rss = Rssreader.new
    # rss.rssrun
    # @topics = Topic.all
    @topics = Topic.page(params[:page])
  end
end
