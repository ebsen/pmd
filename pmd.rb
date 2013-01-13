#!/usr/bin/env ruby -wKU

require 'optparse'
require 'timers'
require 'terminal-notifier'

options = {}
option_parser = OptionParser.new do |opts|
  opts.banner = 'Usage: ./pmd.rb [options] (With no arguments, pmd will start a 25-minute timer.)'
  
  # Switches (on/off)
  opts.on '-h', '--help', 'Display this help screen.' do
    puts opts
    exit
  end
  # opts.on '-cancel', 'Cancel the current timer.' do
    # TODO: Implement a means to cancel the timer.
  # end
  
  # Flags
  opts.on '-s', '--sec TIMER', '--seconds TIMER', 
          'Set the timer in seconds.', Integer do |duration|
    options[:duration] = duration
  end
  opts.on '-m', '--min TIMER', '--minutes TIMER', 
          'Set the timer in minutes.', Float do |duration|
    options[:duration] = 60 * duration
  end
  opts.on '-M', '--message MESSAGE', 
          'Include a message with the timer.' do |message|
    options[:message] = message
  end
  opts.on '-t', '--title TITLE', 'Include a title with the timer.' do |title|
    options[:title] = title
  end
end

option_parser.parse!
# puts options.inspect

# end OptionParser business, now onto business logic!

pomodoro = 60 * 25 # In general, a 'pomodoro' is 25 minutes.

# Implement the default values if left unspecified.
options[:title] = 'Terminal' unless options[:title]
options[:message] = 'Your timer is ready.' unless options[:message]
options[:duration] = pomodoro unless options[:duration]

# Test for a subprocess and create a timer there if we can.
if Process.respond_to? :fork
  Process.fork do
    timer = Timers.new
    timer.after( options[:duration] ) do
      TerminalNotifier.notify( options[:message], :title => options[:title])
    end
    dur = options[:duration]
    puts "Timer set for #{options[:duration]} seconds."
    timer.wait
  end
else
  puts "Couldn't fork the process."
end

puts

# timer.after( options[:duration] ) do
#   TerminalNotifier.notify( options[:message], :title => options[:title])
# end
# dur = options[:duration]
# puts "Timer set for #{options[:duration]} seconds."
# timer.wait