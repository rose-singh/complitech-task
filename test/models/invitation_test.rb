require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  test "Test Validation" do
    @invitation = Invitation.new
    assert !@invitation.valid?,"Invalid Invitation without email"
  end

  test "Email Uniqueness" do
    @invitation = Invitation.new
    @invitation.email = "xyz@gmail.com"
    @invitation.send("perform_validations")
    puts @invitation.errors.inspect
    assert @invitation.errors.keys.include?(:email), "Duplicate Emails not Allowed as Email is already been taken"
  end

  test "Email presence" do
    @invitation = Invitation.new
    @invitation.send("perform_validations")
    puts @invitation.errors.inspect
    assert @invitation.errors.keys.include?(:email), "There should be an error about the email, Email Can't be blank"
  end

  test "Email format" do
    @invitation = Invitation.new
    @invitation.email = "program error"
    @invitation.send("perform_validations")
    puts @invitation.errors.inspect
    assert @invitation.errors.keys.include?(:email), "Email Format Validation Failed,The format of Email is invalid"
  end

  test "TEST VALID Email format" do
    @invitation = Invitation.new
    @invitation.email = "complitech.program@mail.com"
    @invitation.send("perform_validations")
    puts @invitation.errors.inspect
    assert !@invitation.errors.keys.include?(:email), "Email Format Validation Failed,The format of Email is invalid"
  end


  test "Token Generation call back" do
    @invitation = Invitation.create(:email => "token@gmail.com",:expired => false)
    puts @invitation.token
    assert !@invitation.token.blank?,"Token is Present"
  end

end
