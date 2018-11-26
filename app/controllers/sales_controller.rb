class SalesController < ApplicationController
  def sales

    render json: Good.find(1).day.where(date: '2017-03-01')
  end
end
