class TasksController < ApplicationController
  before_filter :authorize

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    your_task?(@task)
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    if your_task?(@task)
      respond_to do |format|
        if @task.save
          format.html { redirect_to projects_url, notice: 'Task was successfully created.' }
          format.json { render json: @task, status: :created, location: @task }
        else
          format.html { render action: "new" }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    if your_task?(@task)
      respond_to do |format|
        if @task.update_attributes(params[:task])
          format.html { redirect_to projects_url, notice: 'Task was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    if your_task?(@task)
      @task.destroy

      respond_to do |format|
        format.html { redirect_to projects_url }
        format.json { head :no_content }
      end
    end
  end

  def up
    @task = Task.find(params[:id])
    if your_task?(@task)
      if @upper_task = Task.where(["priority >= ?", @task.priority]).where(["id != ?", @task.id]).order("priority").first
        @task.update_attributes({:priority => @upper_task.priority + 1})
      end
      respond_to do |format|
        format.html { redirect_to projects_url, notice: @task.priority }
        format.json { head :no_content }
      end
    end
  end

  def down
    @task = Task.find(params[:id])
    if your_task?(@task)
      if @upper_task = Task.where(["priority <= ?", @task.priority]).where(["id != ?", @task.id]).order("priority DESC").first
        @task.update_attributes({:priority => @upper_task.priority - 1})
      end
      respond_to do |format|
        format.html { redirect_to projects_url, notice: @task.priority }
        format.json { head :no_content }
      end
    end
  end
end
