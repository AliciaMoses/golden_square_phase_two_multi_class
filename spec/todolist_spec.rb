require 'todolist'


RSpec.describe TodoList do 
    it "constructs with an empty list of tasks" do 
        tasklist_1 = TodoList.new
        expect(tasklist_1.view_tasks).to eq []
    end 
end