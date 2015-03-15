module DeviseHelper
  # Display devise error messages using the same flash style as the rest of the app. 
  def devise_error_messages!
    unless resource.errors.empty?
      flash[:error] = resource.errors.full_messages.map do |msg| 
        content_tag(:li, msg) 
      end.join.html_safe
    end
    return ''
  end
end