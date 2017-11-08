describe "the signin process", :type => :feature do
  before(:example) do
    # attr1 = attributes_for(:primary_english_result)
    # attr2 = attributes_for(:primary_english_result)
    # post :create, :params => attr1, :format => :json
    # post :create, :params => attr2, :format => :json
    result1 = create(:primary_english_result)
  end

  let(:subject) do
    "primary_english_result".camelize
  end

  let(:pass) do
    "6mVjeZGmWni4rrbWZy5kJynwsiLzKN5q"
  end

  it "" do
    visit "/results?subject=#{subject}&pass=#{pass}"

  end
end
