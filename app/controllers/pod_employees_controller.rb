class PodEmployeesController < ApplicationController
  before_action :get_pod
  before_action :set_employee, only: [:show, :update, :destroy]

  def index
    @employees = @pod.employees
    render json: { status: "SUCCESS", message: "Loaded employees", data: @employees }, status: :ok
  end

  def show
    @employee = Pod.find(params[:id])
    render json: { status: "SUCCESS", message: "Loaded employee", data: @employee }, status: :ok
  end

  def create
    @employee = @pod.employees.build(employee_params)

    if @employee.save
      render json: { status: "SUCCESS", message: "Saved employee", data: @employee }, status: :ok
    else
      render json: { status: "ERROR", message: "employee not saved", data: @employee.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      render json: { status: "SUCCESS", message: "Updated employee", data: @employee }, status: :ok
    else
      render json: { status: "ERROR", message: "employee not updated", data: @employee.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    render json: { status: "SUCCESS", message: "Deleted employee", data: employee }, status: :ok
  end

  private

  def get_pod
    @pod = Pod.find(params[:pod_id])
  end

  def set_employee
    @employee = @pod.employees.find(params[:id])
  end

  def employee_params
    params.permit(:google_user_id, :first_name, :last_name, :email)
  end
end
