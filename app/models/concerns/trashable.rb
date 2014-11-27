module Trashable
  extend ActiveSupport::Concern

  included do
    default_scope { where(is_trashed: false) }
    scope :trashed, -> { unscope(where: :is_trashed).where(is_trashed: true) }
    scope :with_trashed, -> { unscope(where: :is_trashed) }

    define_model_callbacks :trash, :restore
  end

  def trashed?
    is_trashed
  end

  def trash
    run_callbacks(:trash) do
      update_attribute :is_trashed, true
    end
  end

  def restore
    run_callbacks(:restore) do
      update_attribute :is_trashed, false
    end
  end
end
