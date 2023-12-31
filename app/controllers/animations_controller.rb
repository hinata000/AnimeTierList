class AnimationsController < ApplicationController
  before_action :set_tier_list, only: [:show, :index]

  def index
    @q = Animation.where.not(syobocal_tid: nil).ransack(params[:q])
    @animations = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @animation = Animation.find_by(id: params[:id])
    @animations = Animation.where(id: params[:id])
    @animations_detail = AnimationDetail.where(animation_id: params[:id])
    @tier_list = TierList.find_by(animation_id: params[:id])
    @tier_lists = @animation.tier_lists.page(params[:page]).per(10)
  end

  private

    def set_tier_list
      if user_signed_in?
        @tier_list_new = TierList.new
        @tier_list_edit = TierList.find_by(animation_id: params[:id], user_id: current_user.id)
      end
    end
end
