module ApplicationHelper
  # third stage in the evolution of the view: introducing an array of hashes to 
  # handle the nav items
  # rails returns the last value in a subroutine, in this case the array of hashes
  def nav_items
    [
      {
        displaytext: 'Companies',
        controllername: 'companies',
        linkurl: companies_path
      },
      {
        displaytext: 'Projects',
        controllername: 'projects',
        linkurl: projects_path
      },
      {
        displaytext: 'Works',
        controllername: 'works',
        linkurl: works_path
      },
    ]
  end
  
  def display_nav_item (displaytext, controllername, linkurl)
    # if the current controller name == controller name, then add the class active to the <li> tag plus the rest
    # otherwise don't add the class - add nothing
    puts controller_name
    puts controllername
    puts
    raw("<li#{controller_name == controllername ? ' class="active"' : ''}>#{link_to displaytext, linkurl}</li>")
  end
  
  # for user authentication
  def user_logged_in_msg
    str=''
    str+='<div class="userloggedin"'
    if user_signed_in?
      str+="<p id""user_info"">#{current_user}<br>#{link_to('Logout',destroy_user_session_path, :method => :delete)}</p>"
    else 
      str+="<p id""user_info"">#{link_to('Login',new_user_session_path)}|#{link_to('Register',new_user_registration_path)}</p>"
    end
    str+="</div>"
    raw(str)
  end
end
