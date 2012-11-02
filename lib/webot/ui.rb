module Webot
  class UI
    def warn(msg)
			raise NotImplementedError
    end

    def debug(msg)
			raise NotImplementedError
    end

    def error(msg)
			raise NotImplementedError
    end

    def error!(msg)
			raise NotImplementedError
    end

    def info(msg)
			raise NotImplementedError
    end

    def confirm(msg)
			raise NotImplementedError
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
