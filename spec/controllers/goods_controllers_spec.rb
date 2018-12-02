require "rails_helper"

describe GoodsController do 
  describe "#html_sales" do
    it "render html_render" do
      get :html_sales
      response.should render_template('html_sales')
    end
  end

end

# class GoodsControllerTest < ActionController::TestCase
#   context 'GET #html_sales' do
#     setup { get :html_sales }

#     should render_template { 'html_sales' }
#   end
# end