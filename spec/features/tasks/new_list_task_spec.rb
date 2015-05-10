require "rails_helper"

RSpec.describe "the new task page" do
  before :each do
    @list = List.create(title: "Bad List")
  end

  it "creates a new task for the list" do
    visit "/"
    click_link_or_button(@list.title)
    task_title = "Bad Task"
    task_description = "This is stupid"

    fill_in "Title", with: task_title
    fill_in "Description", with: task_description
    
    click_link_or_button("Submit")

    expect(page).to have_content(task_title)
    expect(page).to have_content(task_description)
  end
end