class Run
  def self.run
    $testArray.each do |rb_file|

      begin
        @yamlDataFiles = Command.constructDataFile(rb_file)
      rescue => e
        Result.failed(e)
        Result.tearDown
      end

    begin
      Req.req_all_scripts
      Req.req_all_data_files(@yamlDataFiles)

      Result.suite(Result.suiteName(rb_file))
      Result.testCaseName($currentTestName)

        begin
          tStart = Result.startTimer
          Result.tracer
          load "#{rb_file}"
          tEnd = Result.stopTimer
          totalTime = Result.time(tStart,tEnd)
          Result.pass(totalTime)
          Result.tearDown
        rescue => e
            Result.failed(e)
            Result.tearDown
         end
     rescue => e
          Result.failed(e)
          Result.tearDown
        end
      end
   end
end
