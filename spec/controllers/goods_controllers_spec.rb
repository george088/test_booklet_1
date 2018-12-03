require "rails_helper"

describe GoodsController do 
  before(:each) do
    @item = create(:good)
  end

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
      # item = create(:good)
      get :show, params: { id: @item.id }
      response.should render_template
    end
  end

  describe "#edit" do
    # let(:attr) do 
    #   { :title => 'new title'}
    # end

    # before(:each) do
    #   put :edit, :id => @item.id, :title => attr
    #   @item.reload
    # end

    it "redirect_to goods_path if nothing" do
      get :edit, params: { id: '0' }
      response.should redirect_to(goods_path)
    end

    it "redirect_to goods_path if nothing" do
      get :edit, params: { id: @item.id }
      response.should render_template
    end
  end

  describe "#update" do # нужно как-то поменять логику
    before(:each) do
      @item_update = create(:good)
    end

    it "redirect_to item_update" do
      put :update, params: { good: {id: 1, title: 'updated'} }, format: :json
      response.should redirect_to(assigns(:item))
    end

    it "redirect_to item_update v2" do
      expect{
        put :update, params: { id: 1, title: 'updated' }, format: :json
      }.not_to change(Good,:count)
    end

    it "redirect_to item_update v3" do
      visit edit_good_path(@item_update)

      fill_in "story_title", with: "React"
      fill_in "story_content", with: "Text about React"
    end


    it "render action edit if nothing" do
      put :update, params: { id: '0' }
      response.should render_template('edit')
    end
  end

  describe "#сreate" do
    # let(:attr) do 
    #   { :title => 'new title'}
    # end

    # before(:each) do
    #   put :create, :id => @item.id, :title => attr
    #   @item.reload
    # end

    it "cheking +1 model after create" do
      # post :create, params: { good: { title: 'created' } }, format: :json
      # response.should redirect_to(@item.find_by(title: 'created'))
      expect{
        post :create, params: { good: { title: 'created' } }, format: :json
      }.to change(Good,:count).by(1)
    end

    # it "redirect_to item v1" do
    #   # post :create, params: { good: { title: 'created' } }, format: :json
    #   # response.should redirect_to(@item.find_by(title: 'created'))
    #   expect{
    #     post :create, params: { good: { title: 'created' } }, format: :json
    #   }.to redirect_to(assigns(@item))
    # end

    it "redirect_to item v2" do
      post :create, params: { good: { title: 'created' } }, format: :json
      response.should redirect_to(assigns(:item))
    end


    it "cheking model when not create" do # нужно разобраться как передать не валидные данные
      expect{
        post :create, params: { good: { title: '' } }, format: :json
      }.not_to change(Good,:count)
    end
  end

  describe "#destroy" do
    # let(:attr) do 
    #   { :title => 'new title'}
    # end

    # before(:each) do
    #   put :destroy, :id => @item.id, :title => attr
    #   @item.reload
    # end

    it "redirect to goods_path if ok" do
      get :destroy, params: {id: @item.id}
      response.should redirect_to(goods_path) if @item.destroy
    end

    it "redirect to item if not" do
      get :destroy, params: {id: @item.id}
      response.should redirect_to(goods_path) unless @item.destroy
    end
  end

  describe "#api_sales" do

  end
end
