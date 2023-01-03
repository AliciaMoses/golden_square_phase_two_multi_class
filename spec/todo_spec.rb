require 'todo'

RSpec.describe Todo do 
    it "takes takes task as an argument in the form of a string" do 
        task_one = Todo.new("put the bins out")
        expect(task_one.task).to eq "put the bins out"
    end
    it "initialises with the parameter status which is set to 'incomplete' " do 
        task_one = Todo.new("put the bins out")
        expect(task_one.status).to eq "incomplete"
    end
end 