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
      get :show, params: { id: '0' }
        response.should redirect_to(goods_path)
    end

    it "redirect_to goods_path if nothing" do
      item = create(:good)
      get :show, params: { id: item.id }
      response.should render_template
    end
  end

  describe "#edit" do
    item_edit = create(:good)

    it "redirect_to goods_path if nothing" do
      get :edit, params: { id: '0' }
        response.should redirect_to(goods_path)
    end

    it "redirect_to goods_path if nothing" do
      get :edit, params: { id: item_edit.id }
      response.should render_template
    end
  end

  describe "#update" do # нужно как-то поменять логику
    item_update = create(:good)

    it "redirect_to item_update" do
      get :update, params: { id: item_update.id }
        response.should redirect_to(item_update)
    end
  end
end
