class DaysController < ApplicationController
  def create
    @item = Good.find(params[:goods_id])
    @item.days.create(day_params_permited)
    redirect_to article_path(@item)
  end

  def edit
    
  end

  private

  def day_params_permited
    params.require(:day).permit(:date, :revenue)
  end
end
