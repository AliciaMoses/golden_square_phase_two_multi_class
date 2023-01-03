require 'diary'


RSpec.describe Diary do 
    it "constucts with an empty array of diary entries" do
        my_diary = Diary.new
        expect(my_diary.entries).to eq []
    end
end  