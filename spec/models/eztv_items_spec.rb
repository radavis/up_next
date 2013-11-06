require 'spec_helper'

describe EztvItems do
  it { should have_valid(:show_name).when("Futurama", "Burn Notice") }
  it { should_not have_valid(:show_name).when(nil, "") }

  it { should have_valid(:episode_title).when("Futurestock", "Sea Change") }

  it { should have_valid(:season).when(1, 2, 3) } 
  it { should_not have_valid(:season).when(1234567890) }

  it { should have_valid(:episode).when(10, 22, 55) }
  it { should_not have_valid(:episode).when(1234567890) } 
  
  it { should have_valid(:link).when("http://www.imalink.com/something.torrent") }
  it { should_not have_valid(:link).when(nil, "", "somejunk") }

  it { should have_valid(:description).when("A pizza delivery boy gets launched 1000 years into the future.") }
  it { should have_valid(:comments).when("Awesome show #1") }
  it { should have_valid(:category).when("TV Show") }
  it { should have_valid(:guid).when("something") }
  it { should have_valid(:channel).when("MTV", "BBC", "Ch4") }
end
