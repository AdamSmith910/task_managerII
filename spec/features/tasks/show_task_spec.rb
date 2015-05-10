require "rails_helper"

RSpec.describe "the task show page" do
  before :each do
    @bad_tags = [1, 2]
    @list = List.create(title: "Bad List")
    @task = Task.create(title: "Bad Task",
                        description: "Waste of time",
                        status: "incomplete",
                        list_id: @list.id,
                        tag_ids: @bad_tags)
  end

  it "shows a tasks attributes" do
    visit "/"
    click_link_or_button(@list.title)
    click_link_or_button(@task.title)

    expect(page).to have_content(@task.title)
    expect(page).to have_content(@task.description)
    expect(page).to have_content(@task.status)
    expect(page).to have_content(@task.tags[0].name)
    expect(page).to have_content(@task.tags[1].name)
  end
end