require 'diary'
require 'diary_entry'
require 'diarist'
require 'todo'
require 'todolist'
require 'phonebook'

RSpec.describe "integration" do
    context "when a diary entry is added to Diary class" do 
        it "returns the entries added" do
            my_diary = Diary.new
            first_entry = DiaryEntry.new("first title", "first contents")
            my_diary.add(first_entry)
            expect(my_diary.entries).to eq [first_entry]
        end 
        it "returns a total word count of the diary entries" do
            my_diary = Diary.new
            first_entry = DiaryEntry.new("first title", "first contents")
            second_entry = DiaryEntry.new("second title", "second contents")
            my_diary.add(first_entry)
            my_diary.add(second_entry)
            expect(my_diary.count_words).to eq 4
        end
    end 
    context "When the diarist class is instantiated" do
        it "takes a diary instance and a reading speed as args unless reading speed < 1" do 
            my_diary = Diary.new
            first_entry = DiaryEntry.new("my title", "my contents")
            my_diary.add(first_entry)
            expect { diarist_1 = Diarist.new("my_diary", 0) }.to raise_error "reading speed must be above 1"
        end
        it "returns contents of the longest readable diary entry given available reading time" do
            my_diary = Diary.new
            first_entry = DiaryEntry.new("my title", "my contents")
            second_entry = DiaryEntry.new("my title", "one two three four five")
            my_diary.add(first_entry)
            my_diary.add(second_entry)
            diarist_1 = Diarist.new(my_diary, 10)
            expect(diarist_1.select_readable_entry(1)).to eq second_entry
        end
    end
    context "when an instance of todo is added to a todolist" do
        it "returns a list of tasks" do 
             task_1 = Todo.new("put the bins out")
             tasklist_1 = TodoList.new
             tasklist_1.add(task_1)
             expect(tasklist_1.view_tasks).to eq [task_1]
        end
    end
    context "the phonebook class when instantiated " do 
        it "constructs with an empty list of contacts" do 
            my_diary = Diary.new
            my_phonebook = Phonebook.new(my_diary)
            expect(my_phonebook.view_contacts).to eq []
        end
    end
    context "when the phonebook class takes a diary instance as an arg" do
        it "extracts mobile numbers from diary entries" do
            my_diary = Diary.new
            my_first_entry = DiaryEntry.new("title_1", " I had a missed call from 07999888777")
            my_diary.add(my_first_entry)
            my_phonebook = Phonebook.new(my_diary)
            my_phonebook.add_contacts(my_diary)
            expect(my_phonebook.view_contacts).to eq ["07999888777"]
        end
        it "fails to add numbers to the phonebook that don't match the specified pattern" do 
            my_diary = Diary.new
            my_first_entry = DiaryEntry.new("title_1", "I had a missed call from 07999888777")
            my_second_entry = DiaryEntry.new("title_2", "call 111")
            my_third_entry = DiaryEntry.new("title_3", "new office number 02079999999")
            my_fourth_entry = DiaryEntry.new("title_4", "Alice's new number 07777777777")
            my_fifth_entry = DiaryEntry.new("title_5", "Bob's new number 07777777778")
            my_diary.add(my_first_entry)
            my_diary.add(my_second_entry)
            my_diary.add(my_third_entry)
            my_diary.add(my_fourth_entry)
            my_diary.add(my_fifth_entry)
            my_phonebook = Phonebook.new(my_diary)
            my_phonebook.add_contacts(my_diary)
            expect(my_phonebook.view_contacts).to eq ["07999888777", "07777777777", "07777777778"]
        end

    end



end 
