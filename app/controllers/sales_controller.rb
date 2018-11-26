class SalesController < ApplicationController
  def sales

    # render json: Good.find(1).day.where(date: '2017-03-01')
    #"created_at >= ? AND created_at <= ?", start_date, end_date
    date1 = Date.new(2017,3,1)
    date2 = Date.new(2017,3,10)
    # render json: Good.joins(:day).where(days: {:date => date1..date2})#date: FROM '' TO '2017-03-02'}) #days {date: '2017-03-01'})
    # render json: Day.where(:date => date1..date2).group_by(:goods).sum(:revenue)
    render json: Day.select("good_id as good_id, sum(revenue) as total_revenue").group("good_id")

    # left_outer_joins(:day).distinct.select('good_id.*, SUM(revenue.*) AS revenue_count').group('good.id')
  end
end
