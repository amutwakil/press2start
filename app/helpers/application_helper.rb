module ApplicationHelper
  def is_checked?(checkbox)
    #need to return a boolean, true or false - so when we call it, the 'checked' option will evaluate to whichever
    checkbox == "yes" ? true : false
  end

  def active_link_to(name, path, options = {})
    #basically repurposes the use of link_to, to make sure that the key 'class' in our options hash has the value of 'active' so we
    #can style our various <a> tags in our application with ease
    options[:class] = (current_page?(path)? "active" : "")
    link_to(name, path, options)
  end

end
