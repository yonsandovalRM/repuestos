require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, params: { article: { applicant: @article.applicant, brand_id: @article.brand_id, code: @article.code, description: @article.description, discount: @article.discount, pin: @article.pin, pou: @article.pou, status: @article.status, stock: @article.stock, stock_min: @article.stock_min, stock_store: @article.stock_store, type_article_id: @article.type_article_id, type_format_id: @article.type_format_id, type_vehicle_id: @article.type_vehicle_id } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: { article: { applicant: @article.applicant, brand_id: @article.brand_id, code: @article.code, description: @article.description, discount: @article.discount, pin: @article.pin, pou: @article.pou, status: @article.status, stock: @article.stock, stock_min: @article.stock_min, stock_store: @article.stock_store, type_article_id: @article.type_article_id, type_format_id: @article.type_format_id, type_vehicle_id: @article.type_vehicle_id } }
    assert_redirected_to article_url(@article)
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end
end
