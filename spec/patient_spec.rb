require_relative '../models/patient.rb'

describe Patient do
  let(:patient) { Patient.new("LeeAnne Hawley") }

    describe '#name' do
      it 'returns the patient name' do
        expect(patient.name).to be
      end
    end

    describe '#to_s' do
      it 'returns the patient name appended with the prefix "Patient "' do
        expect(patient.to_s).to eq 'Patient LeeAnne Hawley'

      end
    end
end