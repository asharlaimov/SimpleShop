module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def render_notice(msg = notice)
    if msg
      content_tag :p, msg.to_s, :id => 'notice'
    end
  end

  # Generates check_box for filter for the passed type
  def check_box_for_filter(filter_value, options = {})
    checked = (params[:filter] || []).include?(filter_value.to_s)
    check_box_tag "filter[]", filter_value, checked, options
  end
end