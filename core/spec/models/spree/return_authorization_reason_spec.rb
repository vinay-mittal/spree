require 'spec_helper'

describe Spree::ReturnAuthorizationReason do
  let!(:return_authorization_reason) { create(:return_authorization_reason) }

  describe 'Associations' do
    it { is_expected.to have_many(:return_authorizations).dependent(:restrict_with_error) }
  end
end
