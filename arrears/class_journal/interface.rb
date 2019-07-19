require_relative 'statistic'

class Interface
  attr_accessor :statistic
  def initialize
    @statistic = Statistic.new
    @statistic.init
    menu
  end

  def menu
    puts "-" * 40
    puts "1. Вывести статистику по ученику"
    puts "2. Вывести оценки ученика по предмету"
    puts "3. Общая 'cредняя' статистика"
    puts "4. Показать 5 лучших учеников"
    puts "5. Показать 5 худших учеников"
    puts "6. Показать классный журнал"
    puts "7. Написать письмо родителю"
    puts "0. Выход"
    puts "-" * 40
    answer = gets.to_i
    case answer
    when 1
      id = get_student
      @statistic.average(id)
    when 2
      id = get_student
      subj = get_subject
      @statistic.show_marks_in_subject(id, subj)
    when 3
      @statistic.overall
    when 4
      @statistic.top_five
    when 5
      @statistic.worst_five
    when 6
      readfile('journal') do |file|
         puts file.readlines
      end
    when 7
      make_letter
    end
  end

  def get_student
    puts "Введите номер ученика"
    input = gets.to_i
  end

  def get_subject
    puts "Введите название передмета (russian, world, programming, math, english)"
    input = gets.to_s
  end

  def make_letter
    id = get_student
    puts "Уважаемый родитель!"
    if gender(id) == :male
      puts "Ваш сын "
      if @statistic.a_students.include?(id)
        puts "учится отлично"
      elsif @statistic.b_students.include?(id)
        puts "учится хорошо"
      else
        puts "учится плохо"
      end
    else
      puts "Ваша дочь "
      if @statistic.a_students.include?(id)
        puts "учится отлично"
      elsif @statistic.b_students.include?(id)
        puts "учится хорошо"
      else
        puts "учится плохо"
      end
    end
    @statistic.overall(id)
  end
  Interface.new.menu
end
