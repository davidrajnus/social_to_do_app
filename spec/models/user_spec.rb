require 'rails_helper'

RSpec.describe User, type: :model do

  context "validations" do

    it "should have name and email and password_digest" do
      should have_db_column(:name).of_type(:string)
      should have_db_column(:email).of_type(:string)
      should have_db_column(:password_digest).of_type(:string)
    end

    describe "validates presence and uniqueness of name and email" do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_uniqueness_of(:email) }
    end

    describe "validates password" do
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_length_of(:password).is_at_least(6) }
    end

    # happy_path
    describe "can be created when all attributes are present" do
      When(:user) { User.create(
        name: "Raz",
        email: "raz@nextacademy.com",
        password: "123456",
        password_confirmation: "123456"
      )}
      Then { user.valid? == true }
    end

    # unhappy_path
    describe "cannot be created without a name" do
      When(:user) { User.create(email: "josh@nextacademy.com", password: "123456", password_confirmation: "123456") }
      Then { user.valid? == false }
    end

    describe "cannot be created without a email" do
      When(:user) { User.create(name: "Josh Teng", password: "123456", password_confirmation: "123456") }
      Then { user.valid? == false }
    end


    describe "cannot be created without a password" do
      When(:user) { User.create(name: "Josh Teng", email: "josh@nextacademy.com") }
      Then { user.valid? == false }
    end



    describe "should permit valid email only" do
      let(:user1) { User.create(name: "Tom", email: "tom@nextacademy.com", password: "123456", password_confirmation: "123456")}
      let(:user2) { User.create(name: "Delilah",email: "delilah.com", password: "123456", password_confirmation: "123456") }

      # happy_path
      it "sign up with valid email" do
        # byebug
        expect(user1).to be_valid
      end

      # unhappy_path
      it "sign up with invalid email" do
        expect(user2).to be_invalid
      end
    end
  end

  context 'associations with dependency' do
    it { is_expected.to have_many(:tasks)}
    it { is_expected.to have_many(:posts).dependent(:destroy)}
  end

end