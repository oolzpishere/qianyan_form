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

  let(:subject) do
    "primary_english_result".camelize
  end

  let(:pass) do
    "6mVjeZGmWni4rrbWZy5kJynwsiLzKN5q"
  end

  describe "GET #index" do
    it "" do
      visit "/results?subject=#{subject}&pass=#{pass}"
      
    end
  end

end
