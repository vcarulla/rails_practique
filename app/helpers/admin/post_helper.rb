module Admin
  module PostHelper
    class << self
      def render_states(view)
        view.sanitize(
          statuses(view).map do |status, path|
            view.content_tag :li, class: active_class(view, path) do
              view.link_to status, path
            end
          end.join
        )
      end

      private

      def statuses(view)
        # { 'all' => admin_post_path,
        #   'draft' => by_status_admin_posts_path('draft'),
        #   'published' => by_status_admin_posts_path('published') }
        { 'all' => view.admin_posts_path }.merge(
          Post.statuses.keys.inject({}) do |hash, status|
            hash.merge(status => view.by_status_admin_posts_path(status))
          end
        )
      end

      def active_class(view, path)
        view.current_page?(path) ? 'active' : nil
      end
    end
  end
end
