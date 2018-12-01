class DaysController < ApplicationController
  def create
    @item = Good.find(params[:goods_id])
    @item.days.create(day_params_permited)
    redirect_to article_path(@item)
  end

  def edit
    @item = Good.find(params[:good_id])
    @day = Day.find(params[:id])
  end

  private

  def day_params_permited
    params.require(:days).permit(:date, :revenue)
  end
end
