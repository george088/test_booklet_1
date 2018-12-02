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

    it "render action edit if nothing" do
      get :update, params: { id: '0' }
        response.should render_template('edit')
    end
  end

  describe "#сreate" do
    item_сreate = create(:good)

    it "redirect_to item_сreate" do
      get :create, params: { id: item_сreate.id }
        response.should redirect_to(item_сreate)
    end

    it "render action new if nothing" do
      get :create
        response.should render_template('new')
    end
  end

  describe "#destroy" do
    item_destroy = create(:good)

    it "redirect to goods_path if ok" do
      get :destroy
        response.should redirect_to(goods_path) if item_destroy.destroy
    end

    it "redirect to item if not" do
      get :destroy
        response.should redirect_to(goods_path) if !item_destroy.destroy
    end
  end
end
