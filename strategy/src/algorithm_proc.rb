#!/usr/bin/env ruby

# This is the user of the Strategy. It is called the Context class.
# The context class doesn't know any details of the individual strategies;
# it only knows (and uses) the interface that the strategies implement.
class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(&formatter)
    @title = 'Monthly Report'
    @text = ['lots', 'o', 'text!']
    @formatter = formatter
  end

  def output_report
    @formatter.call(@title, @text)
  end
end

# If the strategies are simple enough, we do not need to create custom objects to create each.
# Instead, we can create Procs (code blocks) that perform the required task.
# These implement the same interface, roughly.
HTML_FORMATTER = lambda do |title, text|
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

PLAIN_TEXT_FORMATTER = lambda do |title, text|
  puts("*** #{title} ***")
  text.each do |line|
    puts line
  end
end

# If you need a new strategy, you can create the proc (block) on the fly. See the tests!
