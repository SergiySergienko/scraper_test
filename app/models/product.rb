# -*- encoding: utf-8 -*-
#
# This is Product model
#
class Product < ApplicationRecord

  validates :source_url, presence: true # source url should be provided
  validates :source_url, uniqueness: true # no need to have 2 same products

  has_many :product_reviews, dependent: :destroy # association to product reviews

  after_create :call_remote_parser # when product was created, run background parsing/fetching by provided uri

  private

  #
  # After create callback
  #
  def call_remote_parser
    PageParserWorker.perform_async(self.id)
  end

end
