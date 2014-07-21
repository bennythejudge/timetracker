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
      {sch1
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
end
