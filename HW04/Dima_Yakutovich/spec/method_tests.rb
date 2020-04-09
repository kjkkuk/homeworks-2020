require_relative '../main_methods.rb'
require 'rspec'

RSpec.describe Array do
  subject { Array.new([1, 2, 3, 4, 5, 'abcd', 256]) }
  describe '#my_map' do
    context 'when default map' do
      it 'should return upd array' do
        expect(subject.my_map { |i| i * 2 })
          .to eq [2, 4, 6, 8, 10, 'abcdabcd', 512]
      end
    end
  end
end
