class ApiGoodsController < ApplicationController

  def index
    @items = Good.all
    json_response(@items)
  end

  def create
    @item = Good.create!(good_params_permited)
    json_response(@item, :created)
  end

  def show
    items = Good
    .left_joins(:day)
    .where('days.good_id == ?', params[:id])
    .select('goods.id AS id, goods.title AS title, days.revenue AS revenue, days.date as date')
    
    json_response(items.collect{|x| {'id' => x.id, 'title' => x.title, 'revenue' => x.revenue.round(2), 'date' => x.date} })
  end

  def update
    @item.update(good_params_permited)
    head :no_content
  end

  def destroy
    Good.find(params[:id]).destroy

    json_response("Товар с id: #{params[:id]}, удалён", :deleted)
  end

  private

  def date_validate date
    Date.parse date rescue nil
  end

  def good_params_permited
    params.require(:good).permit(:title)
  end

  def set_Good
    @item = Good.find(params[:id])
  end

  def json_response(object, status = :ok)
    hh = Hash.new()
    hh['goods'] = object
    hh['status'] = status
    render json: hh
  end
end
