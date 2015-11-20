describe member do

  before(:each) { @member = member.new(email: 'member@example.com') }

  subject { @member }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@member.email).to match 'member@example.com'
  end

end
