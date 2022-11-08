require "application_system_test_case"

class PublicRecipesTest < ApplicationSystemTestCase
  setup do
    @public_recipe = public_recipes(:one)
  end

  test "visiting the index" do
    visit public_recipes_url
    assert_selector "h1", text: "Public recipes"
  end

  test "should create public recipe" do
    visit public_recipes_url
    click_on "New public recipe"

    click_on "Create Public recipe"

    assert_text "Public recipe was successfully created"
    click_on "Back"
  end

  test "should update Public recipe" do
    visit public_recipe_url(@public_recipe)
    click_on "Edit this public recipe", match: :first

    click_on "Update Public recipe"

    assert_text "Public recipe was successfully updated"
    click_on "Back"
  end

  test "should destroy Public recipe" do
    visit public_recipe_url(@public_recipe)
    click_on "Destroy this public recipe", match: :first

    assert_text "Public recipe was successfully destroyed"
  end
end
