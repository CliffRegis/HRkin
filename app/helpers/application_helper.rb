module ApplicationHelper
  
def current_user?(user)
  user == current_user
end

  def  form_group_tag (errors, &block)
    
    if errors.any?
        content_tag :div, capture(&block), class: 'form_group has-error'
    else
        content_tag :div, capture(&block), class: 'form_group'  
    end
  end
  

end
