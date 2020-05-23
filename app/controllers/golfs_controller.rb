class GolfsController < ApplicationController
  def search
    if params[:keyword].present?
      @items = RakutenWebService::Gora::Course.search(keyword: params[:keyword])
    else
      flash.now[:alert] = 'キーワードを入力してください'
      render :search

    end
  end
end
