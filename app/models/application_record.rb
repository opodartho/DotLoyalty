# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  before_validation :set_store

  default_scope { where(store: Current.store) unless [User, Store].any? { |model| self.model.eql?(model) } }

  private

  def set_store
    self.store ||= Current.store if Current.store.present?
  end
end
