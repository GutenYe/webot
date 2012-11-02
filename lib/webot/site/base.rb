require "active_support/core_ext/string/inflections"

module Webot
  module Site
    class Base
      def self.inherited(child)
        Site.sites[child.name.demodulize.underscore] = child
      end

      attr_reader :agent

      def initialize(agent)
        @agent = agent 
      end

      def all
        agent.close
      end

    protected

      def check_login(url_pat)
        agent.wait_until { agent.url =~ url_pat }
      end

    end
  end
end
