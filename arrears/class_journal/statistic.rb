require_relative 'helpers'
require_relative 'journal_generator'
require_relative 'marks'

class Statistic
  attr_accessor :students, :subjects, :b_students

  def initialize
    @perfomance_file = 'perfomance'
    @subjects = ["russian", "math", "english", "world", "programming"]
    @students = []
    @a_students = []
    @b_students = []
    @c_students = []
  end

  def init
    journal = JournalGenerator.new
    journal.generate_students
    Marks.new.generate_marks
    @students = journal.students
    calculate_perfomance
    a_b_c
  end

  def average(id)
    average_mark_for_all_subject = []
    @subjects.each do |s|
      average_mark_for_each_subject = []
      readfile(s) do |file|
        string = file.readlines[id-1]
        marks = string.split(': ')
        marks = marks.drop(1)
        marks = marks[0].split(" ")
        marks = marks.map(&:to_i)
        average_mark_for_each_subject << marks.sum.to_f / marks.length.to_f
        average_mark_for_all_subject << marks.sum.to_f / marks.length.to_f
        puts "Средние оценки по предмету #{s}:"
        puts average_mark_for_each_subject
      end
    end
    puts "Средняя оценка по все предметам:"
    puts average = average_mark_for_all_subject.sum / average_mark_for_all_subject.length
    average.round(3)
  end

  def calculate_perfomance
    perf = 0
    perf_hash = {}
      @students.each_with_index do |student, idx|
        perf = average(idx)
        perf_hash[student]= perf
        perf_hash = perf_hash.sort_by(&:last).reverse.to_h
      end
    writefile(@perfomance_file) do |f|
      id = 1
      perf_hash.each do |k,v|
        f.puts "#{id}) #{k} : #{v}"
        id += 1
      end
    end
  end

  def rating(id)
   file = readfile(@perfomance_file)
   string = file.readlines[id-1]
   puts "Строчка в рейтинге - #{id}) #{string.chomp}"
   puts ""
  end

  def show_marks_in_subject(id, subject)
    readfile(subject) do |f|
      string = f.readlines[id-1]
      puts string
      #array = string.split(":")
      #name = array[0]
      #marks = array[1]
      #puts "#{name} - #{marks}"
    end
  end

  def a_b_c
    mark = ''
    name = ''
    readfile(@perfomance_file) do |file|
      file.readlines.each do |line|
       string = line
       array = string.split(" :")
       id_and_name = array[0].split(") ")
       id = id_and_name[0].to_i
       name = id_and_name[1].chomp
       mark = array[1].chomp.to_f
        if mark > 4.7
          @a_students << id
        elsif mark > 3.0 && mark < 4.7
          @b_students << id
        else
          @c_students << id
        end
      end
    end
  end

  def top_five
    readfile(@perfomance_file) do |file|
      five = file.readlines[0,5]
    puts five
    end
  end

  def worst_five
    readfile(@perfomance_file) do |file|
      five = file.readlines[(25..30)]
    puts five
    end
  end

  def overall
    @a_students = []
    @b_students = []
    @c_students = []
    a_b_c
    puts "Отличников всего: #{@a_students.length}"
    puts "Хорошистов всего: #{@b_students.length}"
    puts "Троечников всего: #{@c_students.length}"
  end

  def gender?(id)
    last_letter_of_surname = @students[id+1].split(" ")[0]
    if last_letter_of_surname[last_letter_of_surname.length - 1] == "a"
      :female
    else
      :male
    end
  end
end
