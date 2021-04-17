module V1
  class CoursesController < ApplicationController
    before_action :set_course, only: [:show]

    # GET /courses
    def index
      @courses = Course.where(degree_ids: params[:degree_ids])

      render json: @courses
    end

    # GET /courses/1
    def show
      render json: @course
    end

    private

    def set_course
      @course = Course.find(params[:id])
    end
  end
end
