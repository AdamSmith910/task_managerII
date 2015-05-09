require "rails_helper"

RSpec.describe "the show list page" do
  before :each do
    List.create(title: "Worst List Ever")
  end

  it "displays the list on the show page" do
    visit "/"
    click_link_or_button("Worst List Ever")

    expect(page).to have_content("Worst List Ever")
    expect(page).to have_content("Tasks")
  end
end