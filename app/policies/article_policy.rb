class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, article)
    @user = user
    @article = article
  end

  def new?
    user
  end

  def create?
    user
  end

  def edit?
    user&.email == @article&.user || user&.admin?
  end

  def update?
    user&.email == @article&.user || user&.admin?
  end

  def destroy?
    user&.admin?
  end
end
