class Diarist

    def initialize(diary, reading_speed)
        @diary = diary
        fail "reading speed must be above 1" if reading_speed < 1
        @reading_speed = reading_speed
    end

    def select_readable_entry(time)
        readable_entries = @diary.entries.reject do |entry|
            calculate_reading_time(entry) > time
        end
        return readable_entries.max_by do |entry|
            entry.count_words
        end
    end
    def calculate_reading_time(entry)
        return (entry.count_words / @reading_speed.to_f).ceil
    end
end