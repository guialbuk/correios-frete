# encoding: UTF-8
require 'spec_helper'

describe Correios::Frete::WebService do
  describe "#request" do
    around do |example|
      Correios::Frete.configure { |config| config.log_enabled = false }
      example.run
      Correios::Frete.configure { |config| config.log_enabled = true }
    end

    let(:frete) { Correios::Frete::Calculador.new }

    it "returns XML response" do
      fake_request_for("<xml><fake></fake>")
      subject.request(frete, [:pac, :sedex]).should == "<xml><fake></fake>"
    end
  end
end
