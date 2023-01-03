class DiaryEntry
    def initialize(title, contents)
        @title = title
        @contents = contents
        @word_count = @contents.split(" ").count
    end
    def title 
        return @title
    end
    def contents
        return @contents
    end 
    def count_words
        return @word_count
    end
end