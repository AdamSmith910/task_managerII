require "rails_helper"

RSpec.describe "the list tasks index page" do
  before :each do
    @bad_list = List.create(title: "Bad List")
    @good_tags = [1, 2]
    @bad_tags = [3, 4]

    @bad_task = Task.create(title: "Bad Task",
                        description: "A stupid task",
                        due_date: Date.new(2018, 1, 1),
                        list_id: @bad_list.id,
                        tag_ids: @good_tags
                        )
    @good_task = Task.create(title: "Good Task",
                        description: "A more stupid task",
                        status: "complete",
                        due_date: Date.new(2018, 1, 1),
                        list_id: @bad_list.id,
                        tag_ids: @bad_tags
                        )
  end

  it "displays a list of all of the incomplete
  tasks belonging to a list" do
    visit "/"
    first(:link, @bad_list.title).click

    expect(page).to have_content(@bad_task.title)
    expect(page).to have_content(@bad_task.description)
    expect(page).to have_content(@bad_task.due_date)
    expect(page).to have_content(@bad_task.tags[0].name)
    expect(page).to have_content(@bad_task.tags[1].name)
  end

  it "does not display a completed task" do
    visit "/"
    click_link_or_button(@bad_list.title)

    expect(page).to_not have_content(@good_task.title)
  end

  it "has a checkbox to mark as complete or
  incomplete" do
    visit "/"
    click_link_or_button(@bad_list.title)

    expect(page).to have_css("input[type='checkbox']")
  end
end