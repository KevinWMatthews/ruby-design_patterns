#!/usr/bin/env ruby

require_relative '../src/module_decorator.rb'

w = SimpleWriter.new('out.txt')
# The last module added is the first one called.
w.extend(NumberingWriter)
w.extend(TimeStampingWriter)

w.write_line('hello')
w.write_line('world')
w.close
