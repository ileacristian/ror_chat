module ApplicationHelper
  def link_with_icon icon, link, text, klass = "", icon_size = 15
    link_to "<span style='font-size:#{icon_size}px'<i class='#{icon}'></i></span> #{text}".html_safe, link, :class => "#{klass}"
  end
end
