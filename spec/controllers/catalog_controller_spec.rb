require 'spec_helper'

describe CatalogController do
  render_views

  describe "GET 'grid'" do
    it "returns http success" do
      get 'grid'
      response.should be_success
    end
  end

end
