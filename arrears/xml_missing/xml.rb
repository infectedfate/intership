class XML
  def method_missing(m, *args, &block)
    "<#{m}> " + args.join('') + " </#{m}>"
  end
end

xml = XML.new

p xml.html
p xml.a('Какая')
p xml.p('шикарная')
p xml.b('штука О_О')
