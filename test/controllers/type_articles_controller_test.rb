# == Schema Information
#
# Table name: type_articles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TypeArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_article = type_articles(:one)
  end

  test "should get index" do
    get type_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_type_article_url
    assert_response :success
  end

  test "should create type_article" do
    assert_difference('TypeArticle.count') do
      post type_articles_url, params: { type_article: { name: @type_article.name } }
    end

    assert_redirected_to type_article_url(TypeArticle.last)
  end

  test "should show type_article" do
    get type_article_url(@type_article)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_article_url(@type_article)
    assert_response :success
  end

  test "should update type_article" do
    patch type_article_url(@type_article), params: { type_article: { name: @type_article.name } }
    assert_redirected_to type_article_url(@type_article)
  end

  test "should destroy type_article" do
    assert_difference('TypeArticle.count', -1) do
      delete type_article_url(@type_article)
    end

    assert_redirected_to type_articles_url
  end
end
