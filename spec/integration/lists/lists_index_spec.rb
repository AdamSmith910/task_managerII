require "rails_helper"

RSpec.describe "the lists index page" do
  before :each do
    List.create(title: "Bad List", archived: false)
    List.create(title: "Good List", archived: true)
  end

  it "displays a heading 'All Lists'" do
    visit "/"

    expect(page).to have_content("All Lists")
  end
end
