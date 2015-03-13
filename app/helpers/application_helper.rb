module ApplicationHelper
  FLASH_TYPE = { success: "success", error: "danger", 
                 alert: "warning", notice: "info" }
 
  def bootstrap_class_for(flash_type)
    FLASH_TYPE[flash_type] || flash_type.to_s
  end
     
  def flash_messages(opts = {})
    flash.each do |key, msg|
      concat(content_tag(:div, msg, class: "alert alert-#{bootstrap_class_for(key)} fade in") do
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat msg
      end)
    end
    nil
  end
end 


# <div class="alert alert-warning alert-dismissible fade in" role="alert">
#   <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
#   <strong>Holy guacamole!</strong> Best check yo self, you're not looking too good.
# </div>  