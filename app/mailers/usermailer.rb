class Usermailer < ActionMailer::Base
  default from: "benedetto@lo-giudice.net"
  
  
  # action to send an email everytime a work item is added
  def workcreated_email(work)
    print "inside workcreated_email"
    @work = work
    mail(to: work.project.owner.email, subject: "Work Item Posted")
  end
  
  def projectupdated_email(project)
    print "inside projectcreated_email"
    @project = project
    mail(to: project.owner.email, subject: "New project created")
  end

end
