require 'rails_helper'

FactoryBot.find_definitions

describe "get all restaurants route", :type => :request do
  let!(:restaurants) { FactoryBot.create_list(:restaurant, 20)}

  before { get '/v1/restaurants'}

  it 'returns all restaurants' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
