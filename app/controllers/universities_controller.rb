class UniversitiesController < ApplicationController

  before_action :set_university, only: [:show]

  def show

  end

  private

    def set_university
      @university = University.find(params[:id])
    end

end