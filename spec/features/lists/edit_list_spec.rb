require "rails_helper"

RSpec.describe "the edit list page" do
  before :each do
    @list = List.create(title: "Another Awful List")
  end

  it "allows user to change title" do
    visit "/"
    click_link_or_button(@list.title)
    click_link_or_button("Edit list")
    new_title = "List Isn't That Bad"

    expect(page).to have_content("Edit List")
    fill_in "Title", with: new_title
    click_link_or_button("Submit")

    expect(page).to have_content(new_title)
  end
end