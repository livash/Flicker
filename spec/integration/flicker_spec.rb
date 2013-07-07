require "spec_helper"


def sign_up
  visit '/'
  click_button("Sign Up for Account here")
  fill_in "user_email", :with => @user
  fill_in "user_password", :with => @password
  fill_in "user_password_confirmation", :with => @password
  click_button "Sign up"
end
def upload_image
  visit new_photo_url
  path = File.join(::Rails.root, "spec/fixtures/images.jpg") 
  attach_file("photo_image_file", path)
  click_button("Upload")
  current_url.should == photo_url(:id => 1)
end
describe "flicker" do
  before :all do
    @user = 'joe@example.com'
    @password = 'password'
  end
describe "create user" do
  it 'should create a user' do
    sign_up
    #then should be redirected to the photos path
    current_url.should == photos_url
    page.has_content?("Your Photostream").should == true
  end
  it 'should allow the user to log in as well' do
    sign_up
    click_link "Logout"
    visit '/'
    click_button("Login here")
    fill_in "user_email", :with => @user
    fill_in "user_password", :with => @password
    click_button "Sign in"
    current_url.should == photos_url
    page.has_content?("Your Photostream").should == true
  end
end
describe "/" do
  it 'should link to the signup page if you arent logged in' do
    visit '/'
    click_button("Sign Up for Account here")
    current_url.should == new_user_registration_url
  end
end
describe 'file upload' do
  it 'should upload a file' do
    sign_up
    upload_image
    #the image should be retrieved ok
    get Photo.find_by_id(1).image.url(:thumb)
    response.code.should == "200"
  end
end
it "should create an album and add an image" do
  sign_up
  upload_image
  visit photos_url
  click_link "Your photo Albums"
  fill_in "album_title", :with => "test album"
  click_button("Add Album")
  visit album_url(:id => 1)
end
end