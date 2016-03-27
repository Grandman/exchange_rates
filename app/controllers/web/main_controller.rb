class Web::MainController < Web::ApplicationController
  def index
    last_forced = Rate.where(forced: true).last
    if last_forced.present? && last_forced.date_to > DateTime.current
      @rate = last_forced
    else
      @rate = Rate.where(forced: false).last
    end
  end
end