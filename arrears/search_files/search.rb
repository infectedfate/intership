class Search

  def search_files(directory = '/**/', target)
    directory += '/**/' unless directory == '/**/'
    target = "*#{filename}" if target[0] == '.'
    directory += target
    @search = Dir.glob(directory)
    @search
    puts "Save search results in file? y/n"
    answer = gets.chomp!
    if answer == 'y'
      save_in_file
    elsif answer == 'n'
      exit
    end
  end

  def save_in_file
    File.open('search_results', 'wb') { |f| f.puts @search.join("\n") }
  end
end
