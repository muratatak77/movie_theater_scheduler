require 'rails_helper'

RSpec.describe "Movies", type: :request do

  data = JSON.parse(File.read("spec/input.json"))

  describe "POST /movies" do
    it "returns http success" do
  		headers = { "ACCEPT" => "application/json" }
    	post "/movies", :params => data, :headers => headers, as: :json
      expect(response).to have_http_status(:success)
    end

  end

end
