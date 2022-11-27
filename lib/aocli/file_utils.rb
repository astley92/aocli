module Aocli
  module FileUtils
    module_function

    def wrap_lines(content, wrap_at: 80)
      content
        .split("\n")
        .map { wrap_line(_1, wrap_at: wrap_at) }
        .flatten
        .join("\n")
    end

    def wrap_line(line, wrap_at:)
      return line unless line.length > wrap_at

      char_count = 0
      results = []
      current_line = ""

      line.split(" ").each do |word|
        if (current_line.length + word.length + 1) > wrap_at
          results << current_line.strip
          current_line = word
          char_count = word.length
        else
          current_line += " #{word}"
          char_count += word.length + 1
        end
      end
      results << current_line.strip unless current_line == ""
      results
    end

    def insert_lines(lines, into:, after:)
      into_array = into.split("\n")
      insert_index = into_array.index(after)
      raise(StandardError, "Cannot find after #{after.inspect}") if insert_index.nil?

      lines.reverse.each do |line|
        into_array.insert(insert_index + 1, line)
      end
      into_array.join("\n")
    end
  end
end
