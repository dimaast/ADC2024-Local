class Api::V1::FacultiesController < ApplicationController
  def index
    @faculties = Faculty.all
  end

  def show
    @faculty = Faculty.find(params[:id])
  end
end
