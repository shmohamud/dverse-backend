class Api::V1::JobsController < ApplicationController

  before_action :set_job, only: [:show,:update,:destroy]

  def index
    @Jobs = Job.all
    render json: @Jobs, status: 200
  end

  def show
    render json: @Job, status: 200
  end

  def create
    @Job = Job.create(body:"default body", title: "default title", industry:"default industry", job_type:"", status:"draft")
    UserJob.create(user_id:params["user_id"], job_id:@Job.id)
        render json: @Job, status: 201
  end

  def update
    params.each do |k, v| 
      puts k 
      puts v
      v[k] = v[k]
     @Job.update(k, v)   
    end
    job_ids = User.find(params[:user_id]).job_ids
      if(!job_ids.include?(params['id'].to_i))
          user = User.find(params[:user_id])
          @Job.users << user
      end
    render json: @Job, status: 200
  end

  def destroy
    @JobId = @Job.id
    @Job.destroy
    render json: { message: "removed" }, status: :ok
  end


  private
  def job_params
    params.permit(:id, :body, :industry, :status, :title, :user_id)
  end

  def set_job
    @Job = Job.find(params[:id])
  end
end


