class PodMembershipsController < ApplicationController
  before_action :get_pod
  # before_action :set_membership, only: [:show, :update, :destroy]

  def index
    @memberships = @pod.memberships
    render json: { status: "SUCCESS", message: "Loaded memberships", data: @memberships }, status: :ok
  end

  def show
    @membership = Membership.find(params[:id])
    render json: { status: "SUCCESS", message: "Loaded membership", data: @membership }, status: :ok
  end

  def create
    @membership = @pod.memberships.build(membership_params)

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

  def get_pod
    @pod = Pod.find(params[:pod_id])
  end

  def set_membership
    @membership = @pod.memberships.find(params[:id])
  end

  def membership_params
    params.permit(:employee_id, :pod_id, :active)
  end
end
