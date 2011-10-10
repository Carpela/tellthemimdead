class WillsController < ApplicationController
  # GET /wills
  # GET /wills.json
  def index
    @wills = Will.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @wills }
    end
  end

  # GET /wills/1
  # GET /wills/1.json
  def show
    @will = Will.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @will }
    end
  end

  # GET /wills/new
  # GET /wills/new.json
  def new
    @will = Will.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @will }
    end
  end

  # GET /wills/1/edit
  def edit
    @will = Will.find(params[:id])
  end

  # POST /wills
  # POST /wills.json
  def create
    @will = Will.new(params[:will])

    respond_to do |format|
      if @will.save
        format.html { redirect_to @will, :notice => 'Will was successfully created.' }
        format.json { render :json => @will, :status => :created, :location => @will }
      else
        format.html { render :action => "new" }
        format.json { render :json => @will.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wills/1
  # PUT /wills/1.json
  def update
    @will = Will.find(params[:id])

    respond_to do |format|
      if @will.update_attributes(params[:will])
        format.html { redirect_to @will, :notice => 'Will was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @will.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wills/1
  # DELETE /wills/1.json
  def destroy
    @will = Will.find(params[:id])
    @will.destroy

    respond_to do |format|
      format.html { redirect_to wills_url }
      format.json { head :ok }
    end
  end
end
