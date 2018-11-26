class SalesController < ApplicationController
  
  def sales

    # render json: Good.find(1).day.where(date: '2017-03-01')
    #"created_at >= ? AND created_at <= ?", start_date, end_date
    
    unless date_validate(params[:from]) && date_validate(params[:to])
      hh = {}
      hh['status'] = :unprocessable_entity
      hh['message'] = 'Неверный формат дат'
      return render json: hh
    end

    date_from = Date.parse(params[:from])
    date_to = Date.parse(params[:to]) 

    unless !(date_from > date_to )
      hh = {}
      hh['status'] = :unprocessable_entity
      hh['message'] = 'Первая дата должна быть меньше(позже) второй'
      return render json: hh
    end
    # return render json: "sis'ki" unless !(date_from > date_to )
    # работает
    # render json: Good.joins(:day).where(days: {:date => date1..date2})#date: FROM '' TO '2017-03-02'}) #days {date: '2017-03-01'})
    # render json: Day.where(:date => date1..date2).select("good_id as good_id, sum(revenue) as total_revenue").group("good_id")
    
    # render json: Good.includes(:day).where(days: {:date => date1..date2})
    
    items = Good
             .left_joins(:day)
             .where(days: {:date => date_from..date_to})
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
  

    private

    def date_validate date
      Date.parse date rescue nil
    end
end
