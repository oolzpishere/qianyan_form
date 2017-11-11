describe "the signin process", :type => :feature do
  before(:example) do
    # attr1 = attributes_for(:primary_english_result)
    # attr2 = attributes_for(:primary_english_result)
    # post :create, :params => attr1, :format => :json
    # post :create, :params => attr2, :format => :json
    create(:primary_english_result)
  end

  let(:entry1) do
    attributes_for(:primary_english_result).dig(:entry)
  end


  let(:subject) do
    "primary_english_result".camelize
  end

  it "have right rows" do
    visit "/results?subject=#{subject}"
    %w(姓名 序号 确认码 提交时间).each do |name|
      expect(page).to have_content(name)
      expect(page).to have_content(entry1[name])
    end
    %w(广西区内报名 广西区外报名 作品评审费 光盘预订).each do |name|
      if entry1[name].to_s.match(/\d/)
        expect(page).to have_content(name)
      end
    end
  end


end
