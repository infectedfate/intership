require_relative 'helpers'

class Marks

  attr_accessor :journal, :subject

  def initialize
    @file = 'journal'
    @subjects = ["russian", "math", "english", "world", "programming"]
    @journal = []
  end

  def get_journal
   readfile(@file) do |file|
     file.each do |line|
       @journal << line.chomp
     end
   @journal = @journal.drop(3)
    end
  end

  def random_marks
    marks = ''
    gen = [(2..3), (2..5), (4..5)]
    marks_gen = gen.sample
    80.times { marks += " #{rand(marks_gen)}" }
    marks
  end

  def generate_marks
    get_journal
    @subjects.each do |s|
     writefile(s) do |file|
      @journal.each do |el|
       file.puts el + " :" + random_marks
        end
      end
    end
    puts "Созданый файлы с оценками"
  end
end
