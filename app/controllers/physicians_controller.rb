class PhysiciansController < ApplicationController
  def index
    @physicians = Physician.all
  end

  def show
    @physician = Physician.find(params[:id])
  end

  def new
    @physician = Physician.new
  end

  def create
    @physician = Physician.new(physician_params)
    if @physician.save
      redirect_to physician_path(@physician)
    else
      render :new
    end
  end

  def edit
    @physician = Physician.find(params[:id])
  end

  def update
    @physician = Physician.find(params[:id])
    if @physician.update(physician_params)
      redirect_to physician_path(@physician)
    else
      render :edit
    end
  end

  def destroy
    @physician = Physician.find(params[:id])
    @physician.destroy
    redirect_to physicians_path
  end

  private

  def physician_params
    params.require(:physician).permit(:first_name, :last_name, :phone_number, :level)
  end
end
