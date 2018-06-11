class SubcategoriesController < ApplicationController
  def index
    @categories = Category.all
    @subcategories = Subcategory.where("category_id = ?", Category.first.id)
  end

  def show
    @subcategories = Subcategory.find_by("id = ?", params[:subcategory_id])
  end

  def update_subcategories
    @subcategories = Subcategory.where("category_id = ?", params[:category_id])
    respond_to do |format|
      format.js
    end
  end
end
