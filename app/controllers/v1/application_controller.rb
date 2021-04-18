module V1
  class ApplicationController < ActionController::API
    rescue_from ActionController::UnpermittedParameters, with: :handle_exception
    rescue_from ActiveRecord::RecordNotFound, with: :handle_exception

    private

    def pagination_info(model)
      {
        "pagination": {

          "currentPageNumber": model.current_page,
          "isFirstPage": model.first_page?,
          "isLastPage": model.last_page?,
          "isOutOfRange": model.out_of_range?,
          "nextPageNumber": model.next_page,
          "prevPageNumber": model.prev_page,
        }
      }
    end

    def handle_exception(exception)
      render json: { error: { message: exception } }, status: :bad_request
    end
  end
end

