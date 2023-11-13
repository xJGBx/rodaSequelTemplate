require "roda"

class Router < Roda
  include Helpers

  plugin :sessions, secret: Settings.secret_key
  plugin :assets, css: "app.css", js: "app.js", path: Settings.root.join("public"), css_dir: "", js_dir: "", timestamp_paths: true
  plugin :render, views: Settings.root.join("app/views")
  plugin :partials
  plugin :route_csrf, require_request_specific_tokens: false, check_header: true
  plugin :flash
  plugin :link_to
  plugin :path
  plugin :all_verbs
  plugin :turbo
  plugin :forme_set, secret: Settings.secret_key
  plugin :content_for
  plugin :typecast_params

  path(:root, "/")

  route do |r|
    r.assets

    check_csrf!

    r.root do
      view "home"
    end
  end


  private

  def pagy(dataset)
    tp = typecast_params
    dataset = dataset.paginate(tp.pos_int("page") || 1, 100)
    pagy = Pagy.new(count: dataset.pagination_record_count, page: dataset.current_page, items: dataset.page_size)

    [pagy, dataset.all]
  end
end