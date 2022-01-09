class DiagnosisItemsController < ApplicationController
  def index
    @diagnosis_items = DiagnosisItem.all
  end

  def show
    @diagnosis_item = DiagnosisItem.find(params[:id])
  end

  def new
    @diagnosis_item = DiagnosisItem.new
    @patients = Patient.all
    @physicians = Physician.all
  end

  def create
    @diagnosis_item = DiagnosisItem.new(diagnosis_item_params)
    if @diagnosis_item.save
      redirect_to diagnosis_item_path(@diagnosis_item)
    else
      @patients = Patient.all
      @physicians = Physician.all
      render :new
    end
  end

  def edit
    @diagnosis_item = DiagnosisItem.find(params[:id])
    @patients = Patient.all
    @physicians = Physician.all
  end

  def update
    @diagnosis_item = DiagnosisItem.find(params[:id])
    if @diagnosis_item.update(diagnosis_item_params)
      redirect_to diagnosis_item_path(@diagnosis_item)
    else
      @patients = Patient.all
      @physicians = Physician.all
      render :edit
    end
  end

  def destroy
    @diagnosis_item = DiagnosisItem.find(params[:id])
    @diagnosis_item.destroy
    redirect_to diagnosis_items_path
  end

  private

  def diagnosis_item_params
    params.require(:diagnosis_item).permit(:content, :patient_id, :physician_id)
  end
end
