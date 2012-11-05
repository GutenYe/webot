module Webot
  class UI
    def warn(msg)
      puts msg
    end

    def debug(msg)
      puts msg
    end

    def error(msg)
      puts msg
    end

    def error!(msg)
      puts msg
      exit 1
    end

    def info(msg)
      puts msg
    end

    def confirm(msg)
      puts msg
    end

    # alias to info.
    def say(*args, &blk)
      info(*args, &blk)
    end

    class Shell < UI
      attr_writer :shell

      def initialize(shell)
        @shell = shell
        @quiet = false
        @debug = ENV['DEBUG']
      end

      def debug(msg)
        @shell.say(msg) if @debug && !@quiet
      end

      def info(msg)
        @shell.say(msg) if !@quiet
      end

      def confirm(msg)
        @shell.say(msg, :green) if !@quiet
      end

      def warn(msg)
        @shell.say(msg, :yellow)
      end

      def error(msg)
        @shell.say(msg, :red)
      end

			def error!(msg)
				error(msg)
				exit 1
			end

      def be_quiet!
        @quiet = true
      end

      def debug!
        @debug = true
      end
    end
  end
end
