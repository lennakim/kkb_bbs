module UsersHelper
  def avatar_tag path
    avatar = path.blank? ? "head-img.gif" : path
    image_tag avatar
  end
end