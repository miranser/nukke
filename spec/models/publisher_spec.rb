# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Publisher, type: :model do
  let(:publisher) { create(:publisher) }

  it 'is valid with valid params' do
    expect(publisher).to be_valid
  end

  it 'is invalid without name' do
    publisher.name = nil
    expect(publisher).to_not be_valid
  end
end
