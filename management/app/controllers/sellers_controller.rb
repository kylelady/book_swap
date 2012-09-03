class SellersController < ApplicationController
	@recv_en = Flag.find_by_key_and_value('receiving_enabled', true)
	@sell_en = Flag.find_by_key_and_value('selling_enabled', true)

  # GET /sellers
  # GET /sellers.json
  def index
    @sellers = Seller.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sellers }
    end
  end

  # GET /sellers/1
  # GET /sellers/1.json
  def show
    @seller = Seller.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @seller }
    end
  end

  # GET /sellers/new
  # GET /sellers/new.json
  def new
		if params[:person_id]
			@seller = Seller.new(:person_id => params[:person_id])
		else
    	@seller = Seller.new
		end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @seller }
    end
  end

  # GET /sellers/1/edit
  def edit
    @seller = Seller.find(params[:id])
  end

  # POST /sellers
  # POST /sellers.json
  def create
    @seller = Seller.new(params[:seller])

    respond_to do |format|
      if @seller.save
        format.html { redirect_to @seller, :notice => 'Seller was successfully created.' }
        format.json { render :json => @seller, :status => :created, :location => @seller }
      else
        format.html { render :action => "new" }
        format.json { render :json => @seller.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sellers/1
  # PUT /sellers/1.json
  def update
    @seller = Seller.find(params[:id])

    respond_to do |format|
      if @seller.update_attributes(params[:seller])
        format.html { redirect_to @seller, :notice => 'Seller was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @seller.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sellers/1
  # DELETE /sellers/1.json
  def destroy
    @seller = Seller.find(params[:id])
    @seller.destroy

    respond_to do |format|
      format.html { redirect_to sellers_url }
      format.json { head :no_content }
    end
  end

	def receive
		logger.debug(params)
		@book = Book.new
		@book.datum = Datum.find(params[:datum_id])
		@book.price = params[:price]
		@book.save

		@person = Person.find(session[:person_id])

		@seller = Seller.new
		@seller.book = @book
		@seller.person = @person
    respond_to do |format|
      if @seller.save
        format.html { redirect_to @person, :notice => 'Receive was successfully created.' }
        format.json { render :json => @seller, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.json { render :json => @seller.errors, :status => :unprocessable_entity }
      end
		end
	end
end
