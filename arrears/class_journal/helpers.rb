def readfile(filename)
  File.open(filename, 'r') { |f| yield(f) }
end

def writefile(filename)
  File.open(filename, 'wb') { |f| yield(f) }
end
