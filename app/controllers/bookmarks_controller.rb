class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @animation = Animation.find(params[:animation_id])
    current_user.bookmark(@animation)
  end

  def destroy
    @animation = current_user.bookmarks.find(params[:id]).animation
    current_user.unbookmark(@animation)
  end
end
