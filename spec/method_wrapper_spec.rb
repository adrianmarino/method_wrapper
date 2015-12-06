require 'spec_helper'

describe 'Method Wrapping' do
  let(:call_block) { ->(method, *args, &block) { method.call(*args, &block) } }
  let(:clazz) { Example }

  context "when wraps an instance method" do
    let(:instance) { clazz.new }

    context "with a block param" do
      before { clazz.wrap_instance_method(pattern: /^a/, &call_block) }

      it "returns a_a_a" do
        expect(instance.a_a_a { 'a' }).to eq('a_a_a')
      end
    end

    context "with a public scope" do
      before { clazz.wrap_instance_method(pattern: /^a$/, &call_block) }

      it "returns a" do
        expect(instance.a).to eq('a')
      end
    end

    context "with a protected scope" do
      before { clazz.wrap_instance_method(pattern: /^protected_method$/, &call_block) }

      it "returns protected_method" do
        expect(instance.protected_method).to eq('protected_method')
      end
    end

    context "with a private scope" do
      before { clazz.wrap_instance_method(pattern: /^private_method$/, &call_block) }

      it "returns private_method" do
        expect(instance.send(:private_method)).to eq('private_method')
      end
    end
  end

  context "when wraps a class method" do
    before { clazz.wrap_method(pattern: /^a$/, &call_block) }

    it "returns class_a" do
      expect(clazz.a).to eq('class_a')
    end
  end
end

class Example  
  class << self
    def a
      'class_a'
    end
  end

  def a
    "a"
  end

  def a_a_a
    "a_a_#{yield}"
  end

  protected

  def protected_method
    'protected_method'
  end

  private

  def private_method
    'private_method'
  end
end
