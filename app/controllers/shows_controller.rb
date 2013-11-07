class ShowsController < ActionController::Base
  def index
    @shows = EztvItems.all.reverse
  end
end
