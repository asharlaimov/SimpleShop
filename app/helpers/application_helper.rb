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
end