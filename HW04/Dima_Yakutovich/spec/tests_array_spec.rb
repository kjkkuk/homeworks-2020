# frozen_string_literal: true

require_relative '../array_methods.rb'
require 'rspec'

RSpec.describe Array do
  subject(:data) { described_class.new([1, 2, 3, 4, 5, 256]) }

  describe '#my_map' do
    context 'when block is given' do
      it 'returns values as the default map' do
        expect(data.my_map { |i| i * 2 })
          .to eq [2, 4, 6, 8, 10, 512]
      end
    end
  end

  describe '#my_select' do
    context 'when block is given' do
      it 'returns outputs eq with select' do
        expect(data.my_select { |x| x.instance_of?(Integer) })
          .to eq [1, 2, 3, 4, 5, 256]
      end
    end
  end

  describe '#my_each' do
    context 'when block is given' do
      it 'returns output as the default each' do
        expectation = expect do
          (data.my_each { |i| puts i * 2 })
        end
        expectation.to output("2\n4\n6\n8\n10\n512\n").to_stdout
      end
    end
  end
end
