class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, :notice => 'Book was successfully created.' }
        format.json { render :json => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, :notice => 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

	def search
		@xact = params[:xact] || session[:xact]
		session[:xact] = @xact
		logger.debug(params)
		@datum = Datum.find_by_isbn(params[:isbn])
		logger.debug(@datum)
		@books = Book.find_all_by_datum_id(@datum.id) if @datum

    respond_to do |format|
      format.html # search.html.erb
      format.json { render :json => @book }
    end
	end

	def receive
		@book = Book.new
		@book.datum = Datum.find(params[:datum_id])
		@book.price = params[:price].sub(/$/, '')
		@person = Person.find(session[:person_id])
		@book.seller = @person

    respond_to do |format|
      if @book.save
        format.html { redirect_to @person, :notice => 'Receive was successfully created.' }
        format.json { render :json => @book, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
		end
	end

  def sell
		@person = Person.find(session[:person_id])

		@book = Book.find(params[:book_id])
		@book.buyer = @person

    respond_to do |format|
      if @book.save
        format.html { redirect_to @person, :notice => 'Sale was successfully created.' }
        format.json { render :json => @book, :status => :created, :location => @buyer }
      else
        format.html { render :action => "new" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
    end
  end
end
