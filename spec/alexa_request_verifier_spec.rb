require 'spec_helper'

RSpec.describe AlexaRequestVerifier, vcr: true do
  it 'has a version number' do
    expect(AlexaRequestVerifier::VERSION).not_to be nil
  end

  it_behaves_like 'a verifier object', AlexaRequestVerifier

  describe '#configuration' do
    it 'returns a configuration object' do
      expect(subject.configuration).to be_a(AlexaRequestVerifier::Configuration)
    end
  end

  describe '#method_missing' do
    it 'responds to verifier methods' do
      expect(subject.configure {  }).to eq(nil)
    end

    it 'raises method missing error' do
      expect{ subject.foo }.to raise_error(NoMethodError, "undefined method `foo' for AlexaRequestVerifier:Module")
    end
  end

  describe '#respond_to_missing?' do
    it 'responds true for verifier methods' do
      expect(subject.respond_to?(:configure)).to eq(true)
    end

    it 'returns false for everything else' do
      expect(subject.respond_to?(:foo)).to eq(false)
    end
  end
end
