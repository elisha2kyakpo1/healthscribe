module ApplicationHelper
  def active_class(link)
    if action_name == link
      'active'
    else
      ''
    end
  end
end
