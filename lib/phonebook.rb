class Phonebook
    def initialize(diary)
        @phonebook = []
    end 

    def add_contacts(diary)
        diary.entries.select do |entry|
            if entry.contents[/07\d{9}\z/]
                then @phonebook << entry.contents[/07\d{9}\z/]
            end
        end
    end
    def view_contacts
        @phonebook.each do |item|
            p item
        end
    end
end