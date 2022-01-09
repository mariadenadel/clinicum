class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
    @patients = Patient.all
    @physicians = Physician.all
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      @patients = Patient.all
      @physicians = Physician.all
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @patients = Patient.all
    @physicians = Physician.all
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      @patients = Patient.all
      @physicians = Physician.all
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :patient_id, :physician_id)
  end
end
