require "pd"
require "optimism"
require "pa"

module Webot
  autoload :VERSION, "webot/version"
  autoload :UI, "webot/ui"
  autoload :CLI, "webot/cli"
  autoload :Site, "webot/site" 

  Error = Class.new Exception
  EFatal = Class.new Exception
  Rc = Optimism.require "webot/rc", "~/.webotrc"

  class << self
    attr_accessor :ui

    def ui
      @ui ||= UI.new
    end
  end
end

