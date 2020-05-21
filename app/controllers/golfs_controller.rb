class GolfsController < ApplicationController
  def search
    if params[:keyword]
      @items = RakutenWebService::Gora::Course.search(keyword: params[:keyword])
    end
  end
end
