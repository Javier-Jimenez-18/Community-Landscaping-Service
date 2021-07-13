require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(email: "jsmith@sample.com", password: "123456", reset_password_token: "123456789", reset_password_sent_at: "2021-07-07 15:00:00", remember_created_at: "2021-07-04 13:00:00") }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without an email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the email address doesn't have a @" do
    subject.email="jsmith.sample.com"
    expect( (subject.email).include?("@") ).to eq(false)
  end
  it "is not valid without a password" do
    subject.password=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the password is less than six characters" do
    subject.password="12345"
    expect(subject).to_not be_valid
  end
end
