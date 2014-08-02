class WorksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    # if i get the :days parameter then show only the recentdays works
    if ( params[:days] )
      @works = Work.recentdays(params[:days]).order('datetimeperformed desc')
    else
      @works = Work.all.order('datetimeperformed desc')
    end
  end
  # any @ variable is visibale from the views
  def show
    @work = Work.find(params[:id])
  end
  
  #adding the "new" function - form and all that
  def new
    @work = Work.new
  end
  
  # modifying for ajax. i need to react depending 
  # of where the request came from
  # adding sending an email when a new item is created
  def create
    
    puts "****************************************************"
    puts current_user
    puts "****************************************************"
    
      @work = Work.new(params[:work].permit(:project_id, :user_id, :datetimeperformed, :hours, :doc))
      # adding the file upload feature
      # uploaded_io gets the file name from the form
      if (params[:doc])
         uploaded_io = params[:doc]
         print "filename: " + uploaded_io.original_filename
         File.open(Rails.root.join('public','uploads',uploaded_io.original_filename),'wb') do |file|
            file.write(uploaded_io.read)
          end
          @work.doc = uploaded_io.original_filename
      end
      @work.user = current_user
      respond_to do |format|
        if @work.save
          Usermailer.workcreated_email(@work).deliver
          format.html {redirect_to @work, notice: 'Work Created' }
          # convention over configuration
          # look for a view template of the new name 
          # see create.js.erb in views/works
          format.js { }
        else
          format.html {render 'new'}
          format.js { }
        end
      end
  end
  
  def edit
    # find the project to edit
    @work = Work.find(params[:id])
  end
  
  def update
    @work = Work.find(params[:id])
    # update it!
    if @work.update(params[:work].permit(:project_id, :user_id, :datetimeperformed, :hours, :doc))
       flash[:notice] = 'Work Updated'
       redirect_to @work
    else
       render 'edit'
    end    
  end
  
end
