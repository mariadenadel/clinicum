class PhysiciansController < ApplicationController
  load_and_authorize_resource

  def create
    if @physician.save
      redirect_to physician_path(@physician)
    else
      render :new
    end
  end

  def update
    if @physician.update(physician_params)
      redirect_to physician_path(@physician)
    else
      render :edit
    end
  end

  def destroy
    @physician.destroy
    redirect_to physicians_path
  end

  private

  def physician_params
    params.require(:physician).permit(:first_name, :last_name, :phone_number, :level)
  end
end
