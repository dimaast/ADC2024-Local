class CommunitiesController < ApplicationController
  load_and_authorize_resource

  # GET /communities or /communities.json
  def index
    @communities = Community.all
  end

  # GET /communities/1 or /communities/1.json
  def show
    @community = Community.find(params[:id])
  end
end
