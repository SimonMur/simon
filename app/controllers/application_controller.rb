class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :expire_hsts
  before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name   = "ThinqBT"
    title       = [controller_name, action_name].join(" ")
    description = "Job posts, health posts, entertainment, celebrity news, Technology news and update"
    image       = options[:image] || "your-default-image-url"
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[thinqbt, TBT, jobs guide in kenya, health guide, entertainment news, latest in Technology, latest cars, celebrity news, trending news],
      twitter: {
        site_name: site_name,
        site: '@thinqbt',
        card: 'summary',
        description: description,
        image: image
      },
      
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
  # ...

  private
  def expire_hsts
    response.headers["Strict-Transport-Security"] = 'max-age=0'
  end
end
