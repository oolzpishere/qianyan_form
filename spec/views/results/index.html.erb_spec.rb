require 'rails_helper'

RSpec.describe "results/index", type: :view do
  # before(:each) do
  #   assign(:results, [
  #            Result.create!(),
  #            Result.create!()
  #          ])
  # end
  before(:example) do
    attr1 = attributes_for(:primary_english_result)
    attr2 = attributes_for(:primary_english_result)
    post :create, :params => attr1, :format => :json
    post :create, :params => attr2, :format => :json
  end
  # it "renders a list of results" do
  #   render
  # end
end
