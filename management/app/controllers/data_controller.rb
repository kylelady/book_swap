class DataController < ApplicationController
	@recv_en = Flag.find_by_key_and_value('receiving_enabled', true)
	@sell_en = Flag.find_by_key_and_value('selling_enabled', true)

  # GET /data
  # GET /data.json
  def index
    @data = Datum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @data }
    end
  end

  # GET /data/1
  # GET /data/1.json
  def show
    @datum = Datum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @datum }
    end
  end

  # GET /data/new
  # GET /data/new.json
  def new
		if params[:isbn]
			@datum = Datum.new(:isbn => params[:isbn])
		else
			@datum = Datum.new
		end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @datum }
    end
  end

  # GET /data/1/edit
  def edit
    @datum = Datum.find(params[:id])
  end

  # POST /data
  # POST /data.json
  def create
    @datum = Datum.new(params[:datum])

    respond_to do |format|
      if @datum.save
        format.html do
					if session[:person_id]
						redirect_to books_search_path(:isbn => @datum.isbn)
					else
						redirect_to @datum, :notice => 'Datum was successfully created.'
					end
				end
        format.json { render :json => @datum, :status => :created, :location => @datum }
      else
        format.html { render :action => "new" }
        format.json { render :json => @datum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /data/1
  # PUT /data/1.json
  def update
    @datum = Datum.find(params[:id])

    respond_to do |format|
      if @datum.update_attributes(params[:datum])
        format.html { redirect_to @datum, :notice => 'Datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @datum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /data/1
  # DELETE /data/1.json
  def destroy
    @datum = Datum.find(params[:id])
    @datum.destroy

    respond_to do |format|
      format.html { redirect_to data_url }
      format.json { head :no_content }
    end
  end
end
