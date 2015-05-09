require "rails_helper"

RSpec.describe "the new list page" do
  it "can create a new list" do
    visit "/"
    click_link_or_button "Create new list"

    fill_in "Title", with: "Terrible List"
    click_link_or_button("Submit")

    expect(page).to have_content("Terrible List")
  end
end
