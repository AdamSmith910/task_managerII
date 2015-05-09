require "rails_helper"

RSpec.describe "the edit list page" do
  before :each do
    List.create(title: "Another Awful List")
  end

  it "allows user to change title" do
    visit "/"
    click_link_or_button("Another Awful List")
    click_link_or_button("Edit list")

    expect(page).to have_content("Edit List")
    fill_in "Title", with: "List Isn't That Bad"
    click_link_or_button("Submit")

    expect(page).to have_content("List Isn't That Bad")
  end
end