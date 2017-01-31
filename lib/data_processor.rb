# -*- encoding: utf-8 -*-
#
# This is remote product pages parsing manager
#
require_relative 'fetchers/base_fetcher'
require_relative 'fetchers/name_fetcher'
require_relative 'fetchers/price_fetcher'
require_relative 'fetchers/reviews_fetcher'

class DataProcessor

  #
  # constructor
  # expecting for product page URL
  #
  def initialize(source_url)
    @source_url = source_url
    @doc = Mechanize.new.get(URI(source_url)) # Instatiate Mechanize gem, provide us ability to parse remote page content
  end

  #
  # Return string with product name
  #
  def get_name
    proceed_data_with(Fetchers::NameFetcher.new(@doc))
  end

  #
  # Return string with product price
  #
  def get_price
    proceed_data_with(Fetchers::PriceFetcher.new(@doc))
  end

  #
  # Return Array of product reviews
  # Array:[title, description]
  #
  def get_reviews
    proceed_data_with(Fetchers::ReviewsFetcher.new(@doc))
  end

  protected

  def proceed_data_with(fetcher_instance)
    fetcher_instance.fetch_data
  end

end