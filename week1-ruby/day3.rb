module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def each &block
      @csv_contents.each do |line|
        yield(CsvRow.new(self, line))
      end
    end
  end

  class CsvRow
    def initialize(csv, line)
      # puts line
      @line = line
      @csv = csv
    end

    def method_missing word, *args
      # puts csv
      index = @csv.headers.index(word.to_s)
      @line[index]
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
# puts m.headers.inspect
# puts m.csv_contents.inspect

m.each {|row| puts row.pilchard}

#test
