class GetStudentsFromFiltersService
  attr_accessor :query, :page_number, :filter_params, :sort_order

  def initialize(query)
    @query = query
    @page_number = @query.fetch("page_number", 1)
    @filter_params = @query.fetch("filter", {})
    @sort_order = @query.fetch("sort", '').split(',')
    @qs = Student.includes(:degree, :courses)
  end

  def call
    @qs = filter_results.page(page_number)
    ordered
  end

  private

  def filter_results
    course_ids = filter_params.fetch("courses", '').split(',')
    degree_ids = filter_params.fetch("degrees", '').split(',')
    if course_ids.present? && degree_ids.present?
      @qs.joins(:courses).where("courses.id in (?)", course_ids)
         .where("students.degree_id in (?)", degree_ids)
    elsif course_ids.present?
      @qs.joins(:courses).where("courses.id in (?)", course_ids)
    elsif degree_ids.present?
      @qs.where("students.degree_id in (?)", degree_ids)
    else
      @qs
    end
  end

  def ordered
    order_by_query = []
    sort_order.each do |order_by|
      order_by_prop, order = order_by.split("::")
      if order_by_prop == "enrollment_no"
        if order == 'desc'
          order_by_query << "students.enrollment_no DESC"
        else
          order_by_query << "students.enrollment_no ASC"
        end
      elsif order_by_prop == 'email'
        if order == 'desc'
          order_by_query << "students.email DESC"
        else
          order_by_query << "students.email ASC"
        end
      elsif order_by_prop == 'name'
        if order == 'desc'
          order_by_query << "students.name DESC"
        else
          order_by_query << "students.name ASC"
        end
      elsif order_by_prop == 'id'
        if order == 'desc'
          order_by_query << "students.id DESC"
        else
          order_by_query << "students.id ASC"
        end
      end
    end
    puts order_by_query
    return @qs.order(order_by_query.join(',')) if order_by_query.present?
    @qs
  end
end
