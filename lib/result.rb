class Result

   def self.suiteName(name)
     fDir = File.dirname(name)
     return File.basename(fDir)
   end

   def self.suite(name)
     dashLength = (name.length) + 14
     dashLength = "=" * dashLength
     puts "\n"
     puts "\e[1;36m [#{name}] Test Suite: \e[0m"
     print "\e[1;35m #{dashLength} \e[0m"
   end

   def self.testCaseName(name)
     puts "\n"
     puts "\e[1m Running: \e[1;34m[#{name}] \e[0m"
    #  puts "\e[1m Browser: \e[1;34m#{b_type} \e[0m"
     # puts "\e[1m Running: \e[1;34m[name] \e[0m"
     puts "\n"
   end

   def self.startTimer
     return Time.now()
   end

   def self.stopTimer
     return Time.now()
   end

   def self.time(startTime, endTime)
     totalTime = endTime - startTime
     return Time.at(totalTime).utc.strftime("\e[1;34m%M \e[0mmins. & \e[1;34m%S \e[0mseconds")
   end

   def self.failed(message)
     puts "\n"
     puts "\n"
     print "\e[41m FAILED! \e[0m"
     puts "\e[31m #{message} \e[0m"
    #  puts "\n"
     subPath = Dir.pwd
     errorId = $errorId.sub("#{subPath}","")
     char = utfChar("\u2715")
     puts "          \e[31m#{char} \e[0m\e[1m File: \e[31m#{errorId} \e[0m\e[1m Method: \e[31m#{$method} \e[0m\e[1mline#: \e[31m#{$erroLine} \e[0m"
   end

   def self.utfChar(char)
     checkmark = "#{char}"
     return checkmark.encode('utf-8')
   end

   def self.pass(time)
     char = utfChar("\u2713")
     thumbChar = utfChar("\u{1F44D}")
    #  \e[1;32m[ OK! ] \e[0m
     puts "\n"
     puts "\n"
     puts "  #{thumbChar}  \e[1m  [  #{time}  ]"
   end

   def self.tearDown
     if ($browser.nil? == false)
           $browser.quit
     end
   end

   def self.tracer
  char = utfChar("\u2713")
  classname1 = "isnotclass"
   set_trace_func proc { |event, file, line, id, binding, classname|
     #puts line
    # puts event
    if classname == Exception then
        $erroLine = line
        $errorId = file
    end

    if $method != nil then
      if $method == id then
        if event == "return" then
          if classname1 != classname
            classname1 = classname
            puts "\e[1;33mClass: \e[1;35m#{classname} \e[0m"
          end
            puts "  \e[1;32m#{char} \e[0m \e[0m\e[1m.\e[1;34m#{$method} \e[0m"
      end
     end
   end
    }
  end

end
