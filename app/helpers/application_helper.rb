module ApplicationHelper
  def format_datetime(datetime, format = "%Y-%m-%d %H:%M")
    datetime.strftime(format)
  end

  def is_admin?
    current_user && (current_user.admin? || current_user.s_admin?)
  end

  def avatar_tag(user, cls = "avatar_img")
    image_tag user.get_avatar, class: cls
  end
end
