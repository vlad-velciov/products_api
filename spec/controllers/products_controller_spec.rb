require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:product) { FactoryBot.attributes_for(:product) }
  before(:each) { request.env["CONTENT_TYPE"] = "application/vnd.api+json" }

  describe 'create' do

    it 'creates a new Product' do
      post :create, params: {data: {type: 'products', attributes: product}}

      expect(response.status).to eq(201)
      expect(response_data[:attributes]).to eq(product)
    end
  end

  describe 'update' do
    let(:product) { FactoryBot.create(:product) }


    it 'can update price and category' do
      put :update, params: {id: product.id, data: {
        id: product.id,
        type: 'products',
        attributes: {
          price: 23,
          category: 'Some other category'
        }}}

      expect(response.status).to eq(200)
      product.reload
      expect(product.category).to eq('Some other category')
      expect(product.price).to eq(23)

    end

    it 'cannot update name' do
      initial_name = product.name
      put :update, params: {id: product.id, data: {id: product.id, type: 'products', attributes: {name: 'second'}}}

      expect(response.status).to eq(403)
      product.reload
      expect(product.name).to eq initial_name
    end
  end

  describe 'delete' do
    let(:product) { FactoryBot.create(:product)}
    it 'deletes a product' do
      delete :destroy, params: {id: product.id }
      expect(response.status).to eq(204)
      expect(response.body).to eq('{}')
    end
  end

  describe 'show' do
    let(:product) { FactoryBot.create(:product)}
  end

  describe 'index' do
    let!(:products) do
      [FactoryBot.create(:product, name: 'first'), FactoryBot.create(:product, name: 'second')]
    end

    it 'gets all products' do
      get :index
      expect(response.status).to eq(200)
      expect(response_data.length).to eq(2)
      expect(response_data.first[:attributes][:name]).to eq(products.first.name)
      expect(response_data.second[:attributes][:name]).to eq(products.second.name)
    end

    describe 'filtering', type: :request  do
      it 'finds a product by name' do
        get "/products?filter[name]=first"

        expect(response.status).to eq(200)
        expect(response_data.length).to eq(1)
        expect(response_data.first[:attributes][:name]).to eq 'first'
      end
    end

  end

  private

  def response_data
    JSON.parse(response.body, {:symbolize_names => true})[:data]
  end
end
