class ApiGoodsController < ApplicationController
    # GET /Goods
    def index
      @items = Good.all
      json_response(@items)
    end
  
    # POST /Goods
    def create
      @item = Good.create!(good_params_permited)
      json_response(@item, :created)
    end
  
    # GET /Goods/:id
    def show

      json_response(Good.find(params[:id]))
    end
  
    # PUT /Goods/:id
    def update
      @item.update(good_params_permited)
      head :no_content
    end
  
    # DELETE /Goods/:id
    def destroy
      # @item.destroy
      Good.find(params[:id]).destroy
      json_response("#{params[:id]}, has deen deleted", :deleted)
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
