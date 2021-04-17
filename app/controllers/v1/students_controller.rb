module V1
  class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :update, :destroy]

    # GET /students
    def index
      @students = GetStudentsFromFiltersService.new(query_params).call

      render json: @students, each_serializer: StudentSerializer::StudentLiteSerializer, meta: pagination_info(@students)
    end

    # GET /students/1
    def show
      render json: @student, serializer: StudentSerializer::StudentDetailSerializer
    end

    # POST /students
    def create
      @student = CreateStudentService.new(student_params).call

      if @student.save
        render json: @student, status: :created, serializer: StudentSerializer::StudentDetailSerializer
      else
        render json: @student.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /students/1
    def update
      @student = UpdateStudentService.new(@student, student_params).call
      if @student.save
        render json: @student, serializer: StudentSerializer::StudentDetailSerializer
      else
        render json: @student.errors, status: :unprocessable_entity
      end
    end

    # DELETE /students/1
    def destroy
      @student.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :email, :enrollment_no, :degree_id, course_ids: [])
    end

    def query_params
      params.fetch(:query, {}).permit(:page_number, :sort, filter: [:courses, :degrees])
    end
  end

end