describe "pages features", :type => :feature do
  describe "index test" do

    it "have the links as expected" do
      visit "/"
      %w(初中英语 高中英语 小学英语 小学数学 小学语文).each do |name|
        expect(page).to have_content(name)
      end
    end

  end
end
