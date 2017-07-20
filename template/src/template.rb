class Report
  def initialize
    @title = 'Monthly Report'
    @text = [ '1', '2' ]
  end

  def output_start
    raise "Called abstract method: #{self.class}.#{__method__}"
  end

  def output_head
    raise "Called abstract method: #{self.class}.#{__method__}"
  end

  def output_body_start
    raise "Called abstract method: #{self.class}.#{__method__}"
  end

  def output_line(line)
    raise "Called abstract method: #{self.class}.#{__method__}"
  end

  def output_end
    raise "Called abstract method: #{self.class}.#{__method__}"
  end

  def output_report
    output_start()
    output_head()
    output_body_start()
    @text.each do |line|
      output_line(line)
    end
    output_body_end()
    output_end()
  end
end

class HtmlReport < Report
  def output_start
    puts('<html>')
  end

  def output_head
    puts('  <head>')
    puts("    <title>#{@title}</title>")
    puts('  </head>')
  end

  def output_body_start
    puts('  <body>')
  end

  def output_line(line)
      puts("    <p>#{line}</p>")
  end

  def output_body_end
    puts('  </body>')
  end

  def output_end
    puts('</html>')
  end
end

class PlainTextReport < Report
  def output_head
    puts("*** #{@title} ***")
  end

  def output_line(line)
    puts(line)
  end

  def output_report
    output_head()
    @text.each do |line|
      output_line(line)
    end
  end
end
