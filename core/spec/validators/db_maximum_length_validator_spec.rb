require 'spec_helper'

Spree::Product.class_eval do
  # Slug currently has no validation for maximum length
  validates :name, db_maximum_length: true
end

describe DbMaximumLengthValidator, type: :model do
  let(:limit_for_name) { Spree::Product.columns_hash['name'].limit.to_i }
  let(:product) { Spree::Product.new }
  let(:name) { 'x' * (limit_for_name + 1) }

  before do
    product.name = name
  end

  it 'should maximum validate name' do
    product.valid?
    debugger
    expect(product.errors[:name]).to include(I18n.t("errors.messages.too_long", count: limit_for_name))
  end
end
