class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    appointment = Appointment.create(params_appointments.merge(user_id: current_user.id))

    if appointment.valid?
      render json: appointment
    else
      render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def authenticate_user!
    if !current_user
      render json: { error: "You must be logged in to perform this action" }, status: :unauthorized
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def params_appointments
    params.require(:appointment).permit(:service, :date, :pet_id, :date_time)
  end
end
