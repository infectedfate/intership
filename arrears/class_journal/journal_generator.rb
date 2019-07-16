require_relative 'helpers'

class JournalGenerator
  attr_accessor :male_names, :female_names, :surnames, :students

  def initialize
    @male_names = ["Иван", "Сергей", "Михаил", "Николай", "Андрей"]
    @female_names = ["Дарья", "Юлия", "Анна", "Алла", "Алена"]
    @surnames = ["Иванов", "Петров", "Сидоров", "Смирнов", "Кузнецов"]
    @students = []
    @teacher = "Иванов И.И."
  end

  def generate_students
    15.times do
      @students << @surnames[rand(5)] + " " + @male_names[rand(5)]
      @students << @surnames[rand(5)] + "a " + @female_names[rand(5)]
    end
    @students << @surnames[0] + " " + @male_names[0]
    @students << @surnames[0] + " " + @male_names[1]
    @students << @surnames[1] + "а " + @female_names[1]
    @students << @surnames[1] + "а " + @female_names[2]
    @students << @surnames[1] + "а " + @female_names[3]

    @students.shuffle
    puts "Класс сгенерирован"
    save_in_file
  end

  def save_in_file
    writefile("journal") do |f|
      f.puts "Школа номер 1652"
      f.puts "#{@teacher} 7А класс"
      f.puts ''
      id = 1
      @students.each do |el|
        f.puts "#{id}) #{el}"
        id += 1
      end
    end
  puts "Создан журнал"
  end
end
