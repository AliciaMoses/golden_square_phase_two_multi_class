class TodoList
    def initialize
        @todolist = []
    end 
    def add(todo)
        @todolist << todo
    end
    def view_tasks
        return @todolist
    end
end 