class Web::MainController < Web::ApplicationController
  def index
    last_forced = Rate.forced.last
    if last_forced.present? && last_forced.date_to > DateTime.current
      @rate = last_forced
    else
      @rate = Rate.normal.last
    end

    gon.rate = @rate&.dollar_rate || 0.0
  end
end