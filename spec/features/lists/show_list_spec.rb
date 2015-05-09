require "rails_helper"

RSpec.describe "the show list page" do
  before :each do
    @list = List.create(title: "Worst List Ever")
  end

  it "displays the list on the show page" do
    visit "/"
    click_link_or_button(@list.title)

    expect(page).to have_content(@list.title)
    expect(page).to have_content("Tasks")
  end

  xit "allows user to delete list" do
    visit "/"
    click_link_or_button(@list.title)
    click_link_or_button("Delete list")

    expect(page).to_not have_content(@list.title)
  end
end