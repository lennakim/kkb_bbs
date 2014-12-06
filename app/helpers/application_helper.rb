module ApplicationHelper
  def format_datetime(datetime, format = "%Y-%m-%d %H:%M")
    datetime.strftime(format)
  end

  def is_admin?
    current_user && (current_user.admin? || current_user.s_admin?)
  end
end
