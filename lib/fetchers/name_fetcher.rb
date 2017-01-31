# -*- encoding: utf-8 -*-
#
# This is product name fetcher
#

module Fetchers
  class NameFetcher < BaseFetcher

    def fetch_data
      self.source.search(self.search_pattern).text.strip
    end

    protected

    def search_pattern
      "//h1[@class='js-product-heading heading-b product-name product-heading']/span"
    end

  end
end
