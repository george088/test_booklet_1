require "rails_helper"

describe GoodsController do 
  describe "#html_sales" do
    it "render html_render" do
      get :html_sales
      response.should render_template('html_sales')
    end
  end

  describe "#new" do
    it "render new" do
      get :new
        response.should render_template('new')
    end
  end

  describe "#show" do
    it "redirect_to goods_path if nothing" do
      get :show, params: { id: '1' }
        response.should redirect_to(goods_path)
    end

    it "redirect_to goods_path if nothing" do
      item = create(:good)
      get :show, params: { id: item.id }

        response.should redirect_to(goods_path)
    end

  end

end

# class GoodsControllerTest < ActionController::TestCase
#   context 'GET #html_sales' do
#     setup { get :html_sales }

#     should render_template { 'html_sales' }
#   end
# end