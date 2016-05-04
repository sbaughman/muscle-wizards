module ApplicationHelper

  def time_til_contest(object=nil)
    if object
      time = nearest_contest_time - object.created_at
    else
      time = nearest_contest_time - Time.now
    end
    render_time(time)
  end

  def render_time(time)
    if time >= 604800
      weeks = (time / 604800).round(1)
      pluralize(weeks, "week")
    else
      days = (time / 86400).to_i
      pluralize(days, "day")
    end
  end

  def nearest_contest
    @prep.contests.order(:date).first
  end

  def nearest_contest_time
    nearest_contest.date
  end

end
