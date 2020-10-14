require 'rails_helper'

RSpec.describe 'Scaner requests', :type => :request do
  it '/scan/:barcode' do
    get '/scan/12345678'
    expect(response).to have_http_status(:ok)
  end

  it '/exit' do
    get '/exit'
    expect(response).to have_http_status(:ok)
  end
end
