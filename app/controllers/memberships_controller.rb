class MembershipsController < ApplicationController

  def create
    membership = Membership.create(membership_params)
    render json: membership, status: :created
  end

  private

  def membership_params
    params.permit(:charge)
  end
  
end
