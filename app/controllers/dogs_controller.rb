class DogsController < ApplicationController
  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.all
    @dog = Dog.new

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @dogs }
    end
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
    @dog = Dog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @dog }
    end
  end

  # GET /dogs/new
  # GET /dogs/new.json
  def new
    @dog = Dog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @dog }
    end
  end

  # GET /dogs/1/edit
  def edit
    @dog = Dog.find(params[:id])
  end

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = Dog.new(params[:dog])

    respond_to do |format|
      if @dog.save
        format.html { redirect_to(@dog, :notice => 'Dog was successfully created.') }
        format.json  { render :json => @dog, :status => :created, :location => @dog }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @dog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dogs/1
  # PUT /dogs/1.json
  def update
    @dog = Dog.find(params[:id])

    respond_to do |format|
      if @dog.update_attributes(params[:dog])
        format.html { redirect_to(@dog, :notice => 'Dog was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @dog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy

    respond_to do |format|
      format.html { redirect_to(dogs_url) }
      format.json  { head :ok }
    end
  end
end
