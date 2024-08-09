module ApplicationHelper
  def is_checked?(checkbox)
    #need to return a boolean, true or false - so when we call it, the 'checked' option will evaluate to whichever
    checkbox == "yes" ? true : false
  end
end
