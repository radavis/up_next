require 'spec_helper'

describe EztvItems do
  it { should have_valid(:show_name).when("Futurama", "Burn Notice") }
end
