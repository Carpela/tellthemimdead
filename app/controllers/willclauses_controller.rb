class WillclausesController < ApplicationController
  # GET /willclauses
  # GET /willclauses.json
  def index
    @willclauses = Willclause.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @willclauses }
    end
  end

  # GET /willclauses/1
  # GET /willclauses/1.json
  def show
    @willclause = Willclause.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @willclause }
    end
  end

  # GET /willclauses/new
  # GET /willclauses/new.json
  def new
    @willclause = Willclause.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @willclause }
    end
  end

  # GET /willclauses/1/edit
  def edit
    @willclause = Willclause.find(params[:id])
  end

  # POST /willclauses
  # POST /willclauses.json
  def create
    @willclause = Willclause.new(params[:willclause])

    respond_to do |format|
      if @willclause.save
        format.html { redirect_to @willclause, :notice => 'Willclause was successfully created.' }
        format.json { render :json => @willclause, :status => :created, :location => @willclause }
      else
        format.html { render :action => "new" }
        format.json { render :json => @willclause.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /willclauses/1
  # PUT /willclauses/1.json
  def update
    @willclause = Willclause.find(params[:id])

    respond_to do |format|
      if @willclause.update_attributes(params[:willclause])
        format.html { redirect_to @willclause, :notice => 'Willclause was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @willclause.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /willclauses/1
  # DELETE /willclauses/1.json
  def destroy
    @willclause = Willclause.find(params[:id])
    @willclause.destroy

    respond_to do |format|
      format.html { redirect_to willclauses_url }
      format.json { head :ok }
    end
  end
end
