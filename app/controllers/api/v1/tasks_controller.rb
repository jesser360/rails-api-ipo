class Api::V1::TasksController < ApplicationController

  require 'time'
  require 'date'


  def index
    render json: Task.all
  end

  def customIndex
    @artist = Artist.find_by_id(params[:artist_id])
    render json: @artist.tasks
  end

  def destroy
    Task.destroy(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update_attributes(task_params)
    render json: task
  end

  # POST /tasks
  # POST /tasks.json
  def create
    task = Task.create(task_params)
    @artist = Artist.find_by_id(task_params[:artist_id])
    task.artist = @artist
    task.save!
    render json: task
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :start, :end, :allDay,:genre,:note,:controller,:action,:artist_id)
    end
end
