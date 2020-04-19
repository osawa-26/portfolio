class ToppagesController < ApplicationController
  def index
    if logged_in?
      @records = current_user.records.order(id: :desc).page(params[:page])
      @total_time = current_user.records.total_minutes(:study_time)
      @today_total_time = current_user.records.where(study_date: Time.current).total_minutes(:study_time)
      @this_week_total_time = current_user.records.where(study_date: Time.current.in_time_zone.all_week).total_minutes(:study_time)
      @this_month_total_time = current_user.records.where(study_date: Time.current.in_time_zone.all_month).total_minutes(:study_time)
    end
  end
end