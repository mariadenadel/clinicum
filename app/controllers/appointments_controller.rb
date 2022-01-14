class AppointmentsController < ApplicationController
  load_and_authorize_resource

  def new
    @patients = Patient.all
    @physicians = Physician.all
  end

  def create
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      @patients = Patient.all
      @physicians = Physician.all
      render :new
    end
  end

  def edit
    @patients = Patient.all
    @physicians = Physician.all
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      @patients = Patient.all
      @physicians = Physician.all
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :patient_id, :physician_id)
  end
end
