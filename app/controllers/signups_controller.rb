class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def render_not_found_response
        render json: { error: "Activity not found" }, status: :not_found
    end
end
