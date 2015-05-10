require "rails_helper"

RSpec.describe "the edit list page" do
  before :each do
    @list = List.create(title: "Bad List")
    @task = Task.create(title: "Bad Task",
                        list_id: @list.id)
  end

  it "allows user to change task attributes" do
    visit "/"
    click_link_or_button(@list.title)
    click_link_or_button(@task.title)
    click_link_or_button("Edit Task")

    fill_in "Title", with: "Good Task"
    fill_in "Description", with: "Good description"
    click_link_or_button("Submit")

    expect(page).to have_content("Good Task")
    expect(page).to_not have_content("Bad Task")
    expect(page).to have_content("Good description")
  end
end