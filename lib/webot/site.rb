require "watir"
require "tagen/watir"
require "active_support/core_ext/module/attribute_accessors"

module Webot
  module Site
    @@sites = {}
    mattr_reader :sites

    class << self
      def has_site?(name)
        sites.has_key?(name)
      end

      def [](name)
        sites[name]
      end

      def init_agent
        agent = Watir::Browser.new(*Rc.browser)
        agent.keep_cookies!

        agent
      end
    end
  end
end

require "webot/site/base"
require "webot/site/area11"
require "webot/site/cnepub"
