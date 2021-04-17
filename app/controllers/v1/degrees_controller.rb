module V1
  class DegreesController < ApplicationController
    before_action :set_degree, only: [:show]

    # GET /degrees
    def index
      @degrees = Degree.all

      render json: @degrees
    end

    # GET /degrees/1
    def show
      render json: @degree
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_degree
      @degree = Degree.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def degree_params
      params.require(:degree).permit(:name, :description)
    end
  end
end
