require 'rails_helper'

RSpec.describe "Students", type: :request do
  describe "GET /students" do
    it "works! (now write some real specs)" do
      get students_path
      expect(response).to have_http_status(200)
    end
  end
end

RSpec.describe "StudentsControllers", type: :request do
  describe "get students_path" do
    it "renders the index view" do
      FactoryBot.create_list(:student, 10)
      get students_path
      expect(response).to render_template(:index)
    end
  end
  describe "get student_path" do
    it "renders the :show template" do
      student = FactoryBot.create(:student)
      get student_path(id: student.id)
      expect(response).to render_template(:show)
    end
    it "redirects to the index path if the student id is invalid" do
      get student_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to students_path
    end
  end
  describe "get new_student_path" do
    it "renders the :new template" do
      get new_student_path
      expect(response).to render_template(:new)
    end
  end
  describe "get edit_student_path" do
    it "renders the :edit template" do
      student = FactoryBot.create(:student)
      get edit_student_path(id: student.id)
      expect(response).to render_template(:edit)
    end
  end
  describe "post students_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      student_attributes = FactoryBot.attributes_for(:student)
      expect { post students_path, params: {student: student_attributes} }.to change(Student, :count)
      expect(response).to redirect_to student_path(id: Student.last.id)
    end
  end
  describe "post students_path with invalid data" do
    it "does not save a new entry or redirect" do
      student_attributes = FactoryBot.attributes_for(:student)
      student_attributes.delete(:first_name)
      expect { post students_path, params: {student: student_attributes} }.to_not change(Student, :count)
      expect(response).to render_template(:new)
    end
  end
  describe "put student_path with valid data" do
    it "updates an entry and redirects to the show path for the student" do
      student = FactoryBot.create(:student)
      put student_path(student.id), params: { student: {phone: "0123456789"} }
      student.reload
      expect(student.phone).to eq("0123456789")
      expect(response).to redirect_to student_path(id: Student.last.id)
    end
  end
  describe "put student_path with invalid data" do
    it "does not update the student record or redirect" do
      student = FactoryBot.create(:student)
      put student_path(student.id), params: { student: {phone: "123"} }
      student.reload
      expect(student.phone).not_to eq("123")
      expect(response).to render_template(:edit)
    end
  end
  describe "delete a student record" do
    it "deletes a student record" do
      student = FactoryBot.create(:student)
      delete student_path(student.id)
      expect(response).to redirect_to students_path
    end
  end
end
