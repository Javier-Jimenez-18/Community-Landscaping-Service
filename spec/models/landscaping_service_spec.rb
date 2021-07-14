require 'rails_helper'

RSpec.describe LandscapingService, type: :model do
  subject { LandscapingService.new( senior: FactoryBot.create(:senior), student: FactoryBot.create(:student), landscape_service: "Mow lawn", fee_per_hour: 14.75, date_time: "2021-07-07 15:00:00") }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid if no senior is selected" do
    subject.senior=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if it does not have a senior first name" do
     subject.senior.first_name=nil
     expect(subject.senior).to_not be_valid
  end
  it "is not valid if it does not have a senior last name" do
     subject.senior.last_name=nil
     expect(subject.senior).to_not be_valid
  end
  it "is valid if no student is selected" do
    subject.student=nil
    expect(subject).to be_valid
  end
  it "is not valid if it does not have a student first name" do
     subject.student.first_name=nil
     expect(subject.student).to_not be_valid
  end
  it "is not valid if it does not have a student last name" do
     subject.student.last_name=nil
     expect(subject.student).to_not be_valid
  end
  it "is not valid if it does not have a landscape service name" do
    subject.landscape_service=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if it does not have a landscape service fee per hour" do
    subject.fee_per_hour=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if it does not have a landscape service date and time" do
    subject.date_time=nil
    expect(subject).to_not be_valid
  end
end
