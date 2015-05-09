require "rails_helper"

RSpec.describe "the list tasks index page" do
  before :each do
    @bad_task = Task.create(title: "Bad Task",
                        description: "A stupid task",
                        status: "incomplete",
                        due_date: 01-01-2018
                        )
    @good_task = Task.create(title: "Bad Task",
                        description: "A more stupid task",
                        status: "complete",
                        due_date: 01-01-2018)

    @bad_list = List.create(title: "Bad List")
    @good_list = List.create(title: "Good List")
    
    @bad_list.tasks << @bad_task
    @bad_list.tasks << @good_task

    @good_list.tasks << @good_task
    @good_list.tasks << @bad_task
  end

  it "displays a list of all of the incomplete
  tasks belonging to a list" do
    visit "/"
    click_link_or_button(@bad_list.title)

    expect(page).to have_content(@bad_task.title)
    expect(page).to have_content(@bad_task.description)
    expect(page).to have_content(@bad_task.due_date)
  end
end