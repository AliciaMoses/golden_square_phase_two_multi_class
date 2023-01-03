require 'diary_entry'

RSpec.describe DiaryEntry do
    it "constructs with a title and contents" do 
        first_entry = DiaryEntry.new("my title", "my contents")
        expect(first_entry.title).to eq "my title"
    end
    it "constructs with a title and contents" do 
        first_entry = DiaryEntry.new("my title", "my contents")
        expect(first_entry.contents).to eq "my contents"
    end
end