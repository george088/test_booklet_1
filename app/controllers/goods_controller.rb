class GoodsController < ApplicationController
  def show
    return redirect_to goods_path unless Good.exists?(params[:id])

    @item = Good.find(params[:id])
  end

  def edit
    return redirect_to goods_path unless Good.exists?(params[:id])

    @item = Good.find(params[:id])
  end
  
  def update
    @item = Good.find(params[:id])

    if @item.update(good_params_permited)
      redirect_to @item 
    else
      render action: 'edit'
    end
  end

  def new
  end

  def create
    @item = Good.new(good_params_permited)

    if @item.save
      redirect_to @item 
    else
      render action: 'new'
    end
  end

  def index
    @items = Good.all
  end

  def destroy
    @item = Good.find(params[:id])

    if @item.destroy 
      redirect_to goods_path
    else
      redirect_to @item
    end
  end

  def html_sales 
  end

  def api_sales

    return json_response_error('Отсутствуют даты', 422) unless (params.has_key?(:from) || params.has_key?(:to))

    return json_response_error('Неверный форма дат', 422) if (date_validate(params[:from]).nil? || date_validate(params[:to].nil?))

    date_from = Date.parse(params[:from])
    date_to = Date.parse(params[:to])

    return json_response_error('Первая дата должна быть меньше(позже) второй', 422) if date_from > date_to
    # return render json: "sis'ki" unless !(date_from > date_to )
    # работает
    # render json: Good.joins(:day).where(days: {:date => date1..date2})#date: FROM '' TO '2017-03-02'}) #days {date: '2017-03-01'})
    # render json: Day.where(:date => date1..date2).select("good_id as good_id, sum(revenue) as total_revenue").group("good_id")
    
    # render json: Good.includes(:day).where(days: {:date => date1..date2})
    
    items = Good
             .left_joins(:days)
             .where(days: {:date => date_from..date_to})
             .select('goods.id AS id, goods.title AS title, SUM(days.revenue) AS revenue')
             .group('goods.id')
    hh = {}
    hh['from'] = date_from
    hh['to'] = date_to
    hh['goods'] = items.collect{|x| {'id' => x.id, 'title' => x.title, 'revenue' => x.revenue.round(2)} }
    sum = 0
    items.collect{|x| sum += x.revenue.round(2)}

    hh['total_revenue'] = sum.round(2)

    render json: hh
  end

  private

    def date_validate date
      Date.parse date rescue nil
    end

    def good_params_permited
      params.require(:good).permit(:title)
    end

    def json_response_error(object, status)
      render json: {'message' => object, 'status' => status}
    end
end
