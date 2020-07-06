class EmployeeMembershipsController < ApplicationController
  before_action :get_employee
  before_action :set_membership, only: [:show, :update, :destroy]

  def index
    @memberships = @employee.memberships
    render json: { status: "SUCCESS", message: "Loaded memberships", data: @memberships }, status: :ok
  end

  def show
    @membership = Membership.find(params[:id])
    render json: { status: "SUCCESS", message: "Loaded membership", data: @membership }, status: :ok
  end

  def create
    @membership = @employee.memberships.build(membership_params)

    if @membership.save
      render json: { status: "SUCCESS", message: "Saved membership", data: @membership }, status: :ok
    else
      render json: { status: "ERROR", message: "membership not saved", data: @membership.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @membership.update(membership_params)
      render json: { status: "SUCCESS", message: "Updated membership", data: @membership }, status: :ok
    else
      render json: { status: "ERROR", message: "membership not updated", data: @membership.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @membership.destroy
    render json: { status: "SUCCESS", message: "Deleted membership", data: membership }, status: :ok
  end

  private

  def get_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_membership
    @membership = @employee.memberships.find(params[:id])
  end

  def membership_params
    params.permit(:employee_id, :pod_id, :active)
  end
end
