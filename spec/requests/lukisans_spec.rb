require 'rails_helper'

RSpec.describe "Lukisans", type: :request do
  describe "GET /lukisans" do
    it "works! (now write some real specs)" do
      get lukisans_path
      expect(response).to have_http_status(422)
    end
  end
end
