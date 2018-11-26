class SalesController < ApplicationController
  def sales

    # render json: Good.find(1).day.where(date: '2017-03-01')
    #"created_at >= ? AND created_at <= ?", start_date, end_date
    date1 = Date.new(2017,3,1)
    date2 = Date.new(2017,3,10)
    
    # работает
    # render json: Good.joins(:day).where(days: {:date => date1..date2})#date: FROM '' TO '2017-03-02'}) #days {date: '2017-03-01'})
    # render json: Day.where(:date => date1..date2).select("good_id as good_id, sum(revenue) as total_revenue").group("good_id")
    
    # render json: Good.includes(:day).where(days: {:date => date1..date2})
    
    items = Good
             .left_joins(:day)
             .select('goods.id AS id, goods.title AS title, SUM(days.revenue) AS revenue')
             .group('goods.id')
  render json: items.collect{|x| [x.id, x.title, x.revenue] }
# => [[2, "Каталог 2", 2], [1, "Каталог 1", 0], [3, "Каталог 3", 1]]
  end
end
