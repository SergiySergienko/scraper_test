# -*- encoding : utf-8 -*-
# This is base class/intefrace for all fetchers
#
module Fetchers
  class BaseFetcher

    attr_accessor :source # provide us setter and getter methods for @source variable

    #
    # When instantiating any child class
    # source variable should be provided
    #
    def initialize(source)
      @source = source
    end

    #
    # This method should contain
    # document parsing logic
    #
    def fetch_data
      raise "This method should be overrided"
    end

  end
end