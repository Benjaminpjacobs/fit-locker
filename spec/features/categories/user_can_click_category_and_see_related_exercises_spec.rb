require 'rails_helper'

RSpec.feature "As a user" do
  before(:all) do
    reset_session!
  end
  
  it "categories link to list of exercises" do
    mg = create(:muscle_group)
    mg.strength_activities.push(create_list(:strength_activity, 5))

    visit muscle_group_index_path
    click_on(mg.name.upcase)
    expect(page.all('#workouts').count).to eq(5)
    expect(page).to have_content(mg.name.upcase)
  end

  it "exercises have links to google search" do
    mg = create(:muscle_group)
    sa = create(:strength_activity, name: 'Pushup')
    mg.strength_activities.push(sa)
    visit muscle_group_index_path
    click_on(mg.name.upcase)
    expect(find_link(sa.name)[:href]).to eq("https://www.google.com/search?q=#{sa.name.downcase}+demonstation")
    expect(find_link(sa.name)[:target]).to eq('_blank')
  end
end

