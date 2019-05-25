require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'create' do

    it 'creates a new Product' do
      @request.env["CONTENT_TYPE"] = "application/vnd.api+json"

      post :create, params: {data: {type: 'products', attributes: {category: 'some category', price: 100, name: 'some name'}}}

      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)).to eq({})
    end
  end

  describe 'update' do

    it 'can only update price and category' do

    end

  end

  describe 'delete' do
  end

  describe 'show' do

  end

  describe 'index' do

    describe 'filtering by name' do

    end

  end
end
