# -*- encoding: utf-8 -*-
#
# This is product reviews fetcher
#

module Fetchers
  class ReviewsFetcher < BaseFetcher

    def fetch_data
      results = []
      reviews = self.source.css(self.review_search_wrapper)
      reviews.each do |review|
        title = review.css(self.title_search_pattern).text.strip
        review_text = review.css(self.description_search_pattern).text.strip
        results.push([title, review_text])
      end
      results
    end

    protected

    #
    # Review text search pattern
    #
    def description_search_pattern
      'div.customer-review-text p.js-customer-review-text'
    end

    #
    # Reviews wrapper search pattern
    #
    def review_search_wrapper
      'div.js-review-content-list div.js-review-list div.Grid.customer-review.js-customer-review div.Grid-col.u-size-8-12-m.js-customer-review-body.customer-review-body'
    end

    #
    # Review title searhc pattern
    #
    def title_search_pattern
      'h3.visuallyhidden'
    end

  end
end