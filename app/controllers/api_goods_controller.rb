class ApiGoodsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  before_action :authenticate_user,  only: [:index, :update, :current, :show]
  before_action :authorize_as_admin, only: [:destroy]
  before_action :authorize,          only: [:update]
  
  def index
    items = Good
    .left_joins(:day)
    .where('days.good_id == goods.id')
    .select('goods.id AS id, goods.title AS title, days.revenue AS revenue, days.date as date')

    # json_response(items.collect{|x| {'id' => x.id, 'title' => x.title, 'revenue' => x.revenue.round(2), 'date' => x.date} }, 'Выданы все товары')
    json_response(items, 'Выданы все товары')
  end

  def create
    @item = Good.create!(good_params_permited)
    json_response(@item, 'Товар создан')
  end

  def show
    item = Good
    .left_joins(:day)
    .where('days.good_id == ?', params[:id])
    .select('goods.id AS id, goods.title AS title, days.revenue AS revenue, days.date as date')
    
    # json_response(item.collect{|x| {'id' => x.id, 'title' => x.title, 'revenue' => x.revenue.round(2), 'date' => x.date} }, "Запрос для #{params[:id]} обработан")
    json_response(item, "Запрос для id: #{params[:id]} обработан")
  end

  def update
    @item.update(good_params_permited)
    head :no_content
  end

  def destroy
    Good.find(params[:id]).destroy

    json_response("Товар с id: #{params[:id]}, удалён", 'Удаление произошло')
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
    render json: {'goods' => object, 'status' => status}
  end
end
