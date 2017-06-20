# == Schema Information
#
# Table name: articles
#
#  id              :integer          not null, primary key
#  code            :string
#  description     :string
#  brand_id        :integer
#  type_article_id :integer
#  type_vehicle_id :integer
#  type_format_id  :integer
#  status          :boolean
#  applicant       :string
#  pin             :integer
#  pou             :integer
#  discount        :integer
#  stock           :float
#  stock_store     :float
#  stock_min       :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  deleted_at      :datetime
#
# Indexes
#
#  index_articles_on_brand_id         (brand_id)
#  index_articles_on_deleted_at       (deleted_at)
#  index_articles_on_type_article_id  (type_article_id)
#  index_articles_on_type_format_id   (type_format_id)
#  index_articles_on_type_vehicle_id  (type_vehicle_id)
#

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
