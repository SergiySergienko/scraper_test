# -*- encoding: utf-8 -*-
#
# This is product price fetcher
#

module Fetchers
  class PriceFetcher < BaseFetcher

    def fetch_data
      self.source.search(self.search_pattern).text.strip.gsub("$", "")
    end

    protected

    def search_pattern
      "//div[@class='js-product-price product-price clearfix']/div[@class='js-price-display Price Price--stylized  Price--large hide-content display-inline-m price-display']"
    end

  end
end
