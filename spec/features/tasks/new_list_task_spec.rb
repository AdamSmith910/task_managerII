require "rails_helper"

RSpec.describe "the new task page" do
  before :each do
    @list = List.create(title: "Bad List")
  end

  it "creates a new task for the list" do
    visit "/"
    click_link_or_button(@list.title)
    click_link_or_button("Create new task")

    fill_in "Title", with: "Bad Task"
    fill_in "Description", with: "Stupid"
    fill_in "Due Date", with: 
end