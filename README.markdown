# Readme
`pmd` is a simple hacked-together CLI to create timers that, once done, create a notification via Mountain Lion's Notification Center.

It carries three dependencies. The two linked come with handy gems.

* OptionParser, from the standard library
* [terminal-notifier](https://github.com/alloy/terminal-notifier)
* [timers](https://github.com/tarcieri/timers)

## Usage
Due to the ridiculously awesomeness of OptionParser, `pmd` includes a few arguments. Run it with the help flag (`-h` or `--help`) or keep reading to see them.

	-h, --help                       Display this help screen.  
	-s, --sec, --seconds TIMER       Set the timer in seconds.  
	-m, --min, --minutes TIMER       Set the timer in minutes.  
	-M, --message MESSAGE            Include a message with the timer.  
	-t, --title TITLE                Include a title with the timer.
  
With no arguments, `pmd` will start a timer for 25 minutes. That value comes from the `pomodoro` variable, so do change it to something more useful to you if you prefer.

The reason for a lot of `pmd`'s structure comes from the terminal-notifier utility that provides the notification goodness, so do read up on that if you're interested too.

## Installation
Yeah, there's nothing really here yet. You just dump the file somewhere in you PATH or `cd` to the directory where it lives. 

## Future plans
1. Make `pmd` better.

# License
I'm issuing this into the Public Domain but licensing regarding timers and terminal-notifier may be different.