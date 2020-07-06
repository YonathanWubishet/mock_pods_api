class EmployeePodsController < ApplicationController
  before_action :get_employee
  # before_action :set_pod, only: [:show, :update, :destroy]

  def index
    @pods = @employee.pods
    render json: { status: "SUCCESS", message: "Loaded pods", data: @pods }, status: :ok
  end

  def show
    @pod = Employee.find(params[:id])
    render json: { status: "SUCCESS", message: "Loaded pod", data: @pod }, status: :ok
  end

  def create
    @pod = @employee.pods.build(pod_params)

    if @pod.save
      render json: { status: "SUCCESS", message: "Saved pod", data: @pod }, status: :ok
    else
      render json: { status: "ERROR", message: "pod not saved", data: @pod.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @pod.update(pod_params)
      render json: { status: "SUCCESS", message: "Updated pod", data: @pod }, status: :ok
    else
      render json: { status: "ERROR", message: "pod not updated", data: @pod.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @pod.destroy
    render json: { status: "SUCCESS", message: "Deleted pod", data: pod }, status: :ok
  end

  private

  def get_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_pod
    @pod = @employee.pods.find(params[:id])
  end

  def pod_params
    params.permit(:name, :lead, :active)
  end
end
