require 'rails_helper'

RSpec.describe Student, type: :model do
  subject { Student.new(first_name: "Javier", last_name: "Jimenez", phone: "2137135342", email: "javi.jimenez18@gmail.com") }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a first_name" do
    subject.first_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last_name" do
    subject.last_name=nil
    expect(subject).to_not be_valid
  end
  it "is valid with the correct full name" do
    expect(subject.full_name).to eq("Javier Jimenez")
  end
  it "is not valid without the correct full name" do
    subject.last_name="Jimenes"
    expect(subject.full_name).to_not eq("Javier Jimenez")
  end
  it "is not valid without a phone number" do
    subject.phone=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is less than 10 digits" do
    subject.phone = "123456789"
    expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is more than 10 digits" do
    subject.phone = "01234567890"
    expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not all digits" do
    subject.phone = "012345678a"
    expect( (subject.phone).match?(/\A-?\d+\Z/) ).to eq(false)
  end
  it "is not valid if the email address doesn't have a @" do
    subject.email="javi.jimenez18&gmail.com"
    expect( (subject.email).include?("@") ).to eq(false)
  end
end
