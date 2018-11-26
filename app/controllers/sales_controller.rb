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
             .where(days: {:date => date1..date2})
             .select('goods.id AS id, goods.title AS title, SUM(days.revenue) AS revenue')
             .group('goods.id')
    hh = {}
    hh['from'] = date1
    hh['to'] = date2
    hh['goods'] = items.collect{|x| [x.id, x.title, x.revenue.round(2)] }
    sum = 0
    items.collect{|x| sum += x.revenue.round(2)}
    
    hh['total_revenue'] = sum.round(2)
  render json: hh
  end
end
