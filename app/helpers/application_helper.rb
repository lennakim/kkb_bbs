module ApplicationHelper
  def format_datetime(datetime, format = "%Y-%m-%d %H:%M:%S")
    datetime.strftime(format)
  end
end
