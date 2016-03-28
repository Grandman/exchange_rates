class Web::AdminsController < Web::ApplicationController
  def show
    @forced_rate_form = ForcedRateForm.new
  end

  def create
    @forced_rate_form = ForcedRateForm.new rate_params
    if @forced_rate_form.valid?
      @rate = Rate.new rate_params
      @rate.forced = true
      @rate.save!
      PublishService.perform @rate.dollar_rate
      DollarRateWorker.perform_at @rate.date_to
      redirect_to admin_path
    else
      render :show
    end
  end

  private

  def rate_params
    params.require(:forced_rate_form).permit(:dollar_rate, :date_to)
  end
end