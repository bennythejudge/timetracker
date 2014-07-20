module ApplicationHelper
  def display_nav_item (displaytext, controllername, linkurl)
    # if the current controller name == controller name, then add the class active to the <li> tag plus the rest
    # otherwise don't add the class - add nothing
    raw("<li#{controller_name == controllername ? ' class="active"' : ''}>#{link_to displaytext, linkurl}</li>")
    
  end
end
