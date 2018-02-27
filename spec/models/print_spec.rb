require 'rails_helper'

describe Print do

  it 'should print with selected printer' do
    print = build(:print)
    expect(print.to_s).to include(" -P 'printer_name'")
  end

  it 'should print with duplex' do
    print = build(:print)
    expect(print.to_s).to include(" -o sides='two-sided-long-edge'")
  end

  it 'should print with simplex' do
    print = build(:print, duplex: false)
    expect(print.to_s).to include(" -o sides='one-sided'")
  end

  it 'should print with the correct number of copies' do
    print = build(:print)
    expect(print.to_s).to include(' -# 100 ')
  end

  it 'should collate' do
    print = build(:print)
    expect(print.to_s).to include(" -o collate='True'")
  end

  it 'should print with ranges' do
    print = build(:print)
    expect(print.to_s).to include(" -o page-ranges='3, 5-7'")
  end

  it 'should print with ppi' do
    print = build(:print)
    expect(print.to_s).to include(" -o ppi='600'")
  end

  it 'should print with media' do
    print = build(:print)
    expect(print.to_s).to include(" -o media='A3'")
  end

  it 'should force print with grayscale' do
    print = build(:print)
    expect(print.to_s).to include(" -o 'ColorModel=Gray'")
    expect(print.to_s).to include(" -o 'ColorMode=False'")
  end
end
