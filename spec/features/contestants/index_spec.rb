require "rails_helper"

RSpec.describe "Contestants Index" do
  it "shows all Contestants and their projects" do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    contestants = [jay, gretchen, kentaro, erin]

      ContestantProject.create!(contestant: jay, project: news_chic)
      ContestantProject.create!(contestant: gretchen, project: news_chic)
      ContestantProject.create!(contestant: gretchen, project: upholstery_tux)
      ContestantProject.create!(contestant: kentaro, project: boardfit)
      ContestantProject.create!(contestant: kentaro, project: upholstery_tux)
      ContestantProject.create!(contestant: erin, project: boardfit)

    visit "/contestants"

    expect(page).to have_content(jay.name) #1
    expect(page).to have_content(gretchen.name) #1 3
    expect(page).to have_content(kentaro.name) #3 2
    expect(page).to have_content(erin.name) #2

    # save_and_open_page



    expect(page).to have_content("News Chic")
    expect(page).to have_content("Upholstery Tuxedo")
    expect(page).to have_content("Boardfit")



  end
end
