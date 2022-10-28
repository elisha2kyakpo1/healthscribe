require 'application_system_test_case'

class FoodsTest < ApplicationSystemTestCase
  setup do
    @food = foods(:one)
  end

  test 'visiting the index' do
    visit foods_url
    assert_selector 'h1', text: 'Foods'
  end

  test 'should create food' do
    visit foods_url
    click_on 'New food'

    fill_in 'Comment', with: @food.comment
    fill_in 'Date', with: @food.date
    fill_in 'Name', with: @food.name
    fill_in 'Symptom', with: @food.symptom_id
    fill_in 'Time', with: @food.time
    click_on 'Create Food'

    assert_text 'Food was successfully created'
    click_on 'Back'
  end

  test 'should update Food' do
    visit food_url(@food)
    click_on 'Edit this food', match: :first

    fill_in 'Comment', with: @food.comment
    fill_in 'Date', with: @food.date
    fill_in 'Name', with: @food.name
    fill_in 'Symptom', with: @food.symptom_id
    fill_in 'Time', with: @food.time
    click_on 'Update Food'

    assert_text 'Food was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Food' do
    visit food_url(@food)
    click_on 'Destroy this food', match: :first

    assert_text 'Food was successfully destroyed'
  end
end
