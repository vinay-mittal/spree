require 'spec_helper'

describe Spree::RefundReason do
  let!(:default_refund_reason) { create(:default_refund_reason) }

  describe 'Associations' do
    it { is_expected.to have_many(:refunds).dependent(:restrict_with_error) }
  end
end
