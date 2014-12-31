module ApplicationHelper
  # Large offset causes slow query, but maybe kaminari has this kind of option
  def limited_paginate(scope, options = {}, &block)
    paginator = Kaminari::Helpers::Paginator.new self, options.reverse_merge(
      current_page: scope.current_page,
      per_page:     scope.limit_value,
      total_count:  1000,
      total_pages:  10,
      remote:       false,
    )
    paginator.to_s
  end

  def sunspot_paginate(results, options = {}, &block)
    paginator = Kaminari::Helpers::Paginator.new self, options.reverse_merge(
      current_page: results.current_page,
      per_page:     results.limit_value,
      total_count:  [results.total_count, 1000].min,
      total_pages:  [results.total_pages, 10].min,
      remote:       false,
    )
    paginator.to_s
  end
end
