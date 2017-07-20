#!/usr/bin/env ruby

# This is the user of the Strategy. It is called the Context class.
# The context class doesn't know any details of the individual strategies;
# it only knows (and uses) the interface that the strategies implement.
class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(formatter)
    @title = 'Monthly Report'
    @text = ['lots', 'o', 'text!']
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(@title, @text)
  end
end

# This is the 'strategy' of the Strategy patter; it is a family of objects.
# Each different strategy does the same thing but in a different way.
# They must all support the same interface.
class HTMLFormatter
  def output_report( title, text )
    puts('<html>')
    puts('  <head>')
    puts("    <title>#{title}</title>")
    puts('  </head>')
    puts('  <body>')
    text.each do |line|
      puts("    <p>#{line}</p>" )
    end
    puts('  </body>')
    puts('</html>')
  end
end

class PlainTextFormatter
  def output_report(title, text)
    puts("*** #{title} ***")
    text.each do |line|
      puts line
    end
  end
end
