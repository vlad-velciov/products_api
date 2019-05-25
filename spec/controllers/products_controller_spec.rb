require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'create' do

    it 'creates a new Product' do
      post :create, params: {name: 'foo', category: 'some category', price: 100}

      expect(response.status).to eq(201)
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

  end

  describe 'search' do

  end
end
