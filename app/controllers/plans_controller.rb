class PlansController < ApplicationController
  def create
    @plan = Plan.new(data: params.require(:plan))
    render_json(@plan)
  end

  def index
    @plans = Plan.all.to_json
    render_json(@plans)
  end

  def show
    @plan = Plan.find(params[:id])
    render_json(@plan)
  end
end
