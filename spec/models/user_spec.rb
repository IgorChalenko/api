require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validation' do
    subject { create(:user) } 
    
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should have_secure_password }
    it do
          should validate_length_of(:password).
            is_at_least(6).
              on(:create)
        end
    it { should validate_uniqueness_of(:email) }
  end
  
end