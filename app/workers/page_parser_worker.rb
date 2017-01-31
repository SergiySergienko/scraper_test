# -*- encoding: utf-8 -*-
#
# This is background html page parser
# Based on sidekiq
#
require_relative '../../lib/data_processor'

class PageParserWorker
  include Sidekiq::Worker

  def perform(product_id)
    current_product = Product.find(product_id)
    begin
      current_processor = ::DataProcessor.new(current_product.source_url)
      reviews = current_processor.get_reviews
      current_product.name = current_processor.get_name
      current_product.price = current_processor.get_price
      if reviews
        reviews.each do |review|
          current_product.product_reviews.build( title: review[0], description: review[1] )
        end
      end
      current_product.save
    rescue => e
      puts "Error :: #{e.message}"
    end

  end
end
