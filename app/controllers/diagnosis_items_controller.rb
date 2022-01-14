class DiagnosisItemsController < ApplicationController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.json do
        @diagnosis_items = DiagnosisItem.where(patient_id: params[:patient_id])
        render json: @diagnosis_items
      end
      format.html
    end
  end

  def new
    @patients = Patient.all
    @physicians = Physician.all
  end

  def create
    if @diagnosis_item.save
      redirect_to diagnosis_item_path(@diagnosis_item)
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
    if @diagnosis_item.update(diagnosis_item_params)
      redirect_to diagnosis_item_path(@diagnosis_item)
    else
      @patients = Patient.all
      @physicians = Physician.all
      render :edit
    end
  end

  def destroy
    @diagnosis_item.destroy
    redirect_to diagnosis_items_path
  end

  private

  def diagnosis_item_params
    params.require(:diagnosis_item).permit(:content, :patient_id, :physician_id)
  end
end
