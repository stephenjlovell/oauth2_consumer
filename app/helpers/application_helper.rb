module ApplicationHelper
 
  def bootstrap_class_for(flash_type)
    f = flash_type.to_s
    { "success" => "success", "error" => "danger", 
      "alert" => "warning", "notice" => "info" }[f] || f
  end
     
end 
