require 'spec_helper'

describe 'Method Wrapping' do
  let(:call_block) { ->(method, *args, &block) { method.call(*args, &block) } }

  context "when wrap an instance method" do
    let(:instance) { Example.new }

    before { Example.wrap_instance_method(pattern: /^a$/, &call_block) }

    it "returns a" do
      response = Example.new.a
      expect(response).to eq('a')
    end
  end

  context "when wrap instance method with a block param" do
    before { Example.wrap_instance_method(pattern: /^a/, &call_block) }

    it "returns a_a_a" do
      response = Example.new.a_a_a { 'a' }
      expect(response).to eq('a_a_a')
    end
  end

  context "when wrap a class method" do
    before { Example.wrap_method(pattern: /^a$/, &call_block) }

    it "returns class_a" do
      response = Example.a
      expect(response).to eq('class_a')
    end
  end
end

class Example
  def a
    "a"
  end

  def a_a_a
    "a_a_#{yield}"
  end

  def self.a
    'class_a'
  end
end
