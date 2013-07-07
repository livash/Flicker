require "spec_helper"
describe "javascript tests" do
  describe "albums" do
    
    it 'should add an image via drag and drop' do
      #sign_up
      #upload_image
      visit photos_url
      click_link "Your photo Albums"
      fill_in "album_title", :with => "test album"
      click_button("Add Album")
      visit album_url(:id => 1)
      draggable = @driver.find('//div[@id="h"]').first
            droppable = @driver.find('//div[@id="photo_id_1"]').first
            draggable.drag_to(droppable)
            puts droppable[:class].inspect
    end
  end
end