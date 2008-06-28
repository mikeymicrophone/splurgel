# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def profile_link
    link_to current_user.login, current_user
  end
end
