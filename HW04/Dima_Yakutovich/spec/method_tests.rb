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

RSpec.describe Array do
  subject { Array.new([1, 2, 3, 4, 5, 'abcd', 256]) }
  describe '#my_select' do
    context 'when default select' do
      it 'should return instance of integer into array with select' do
        expect(subject.my_select { |x| x.instance_of?(Integer) })
          .to eq [3, 2, 1, 4, 5, 256]
      end
    end
  end
end
