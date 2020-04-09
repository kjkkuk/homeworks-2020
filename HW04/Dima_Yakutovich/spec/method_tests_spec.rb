# rubocop:disable Metrics/BlockLength

require_relative '../main_methods.rb'
require 'rspec'

RSpec.describe Array do
  subject { Array.new([1, 2, 3, 4, 5, 256]) }
  describe '#my_map' do
    context 'when default map' do
      it 'should return upd array' do
        expect(subject.my_map { |i| i * 2 })
          .to eq [2, 4, 6, 8, 10, 512]
      end
    end
  end
  subject { Array.new([1, 2, 3, 4, 5, 256, 'abcd']) }
  describe '#my_select' do
    context 'when default select' do
      it 'should return instance of integer into array with select' do
        expect(subject.my_select { |x| x.instance_of?(Integer) })
          .to eq [1, 2, 3, 4, 5, 256]
      end
    end
  end
  subject { Array.new([1, 2, 3, 4, 5, 256]) }
  describe '#my_each' do
    context 'when def each' do
      it 'should return column of output' do
        expectation = expect do
          (subject.my_each { |i| puts i * 2 })
        end
        expectation.to output("2\n4\n6\n8\n10\n512\n").to_stdout
      end
    end
  end
end
