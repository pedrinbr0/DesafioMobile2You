require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should import csv" do
    file = fixture_file_upload('files/netflix_titles.csv', 'text/csv')
    post import_movies_url, params: { file: file }
    assert_response :success
  end

  test "should get movies list" do
    get movies_url
    assert_response :success
    assert_includes response.body, "title"
  end

  test "should filter movies by year" do
    get movies_url, params: { release_year: 2020 }
    assert_response :success
  end
end
