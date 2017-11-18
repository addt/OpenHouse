require 'rails_helper'
require 'spec_helper'
include TimeHelper

describe TimeHelper do
  it 'converts properly' do
    expect(range_to_ampm('09:00-23:45')).to match('9:00 a.m. - 11:45 p.m.')
    expect(range_to_ampm('00:00-10:10')).to match('12:00 a.m. - 10:10 a.m.')
    expect(range_to_ampm('23:59-24:00')).to match('11:59 p.m. - 12:00 a.m.')
    expect(range_to_ampm('12:00-12:02')).to match('12:00 p.m. - 12:02 p.m.')
  end
end
