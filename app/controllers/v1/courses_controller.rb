module V1
  class CoursesController < ApplicationController
    before_action :set_course, only: [:show]

    # GET /courses
    def index
      @courses = Course.where(degree_id: params[:degree_id])

      render json: @courses, each_serializer: CourseSerializer::CourseLiteSerializer
    end

    # GET /courses/1
    def show
      render json: @course, serializer: CourseSerializer::CourseDetailSerializer
    end

    private

    def set_course
      @course = Course.find(params[:id])
    end
  end
end
