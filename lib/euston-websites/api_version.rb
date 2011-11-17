# Taken from:
# http://freelancing-gods.com/posts/versioning_your_ap_is

module Euston
module Websites
  class ApiVersion
    def initialize version
      @version = version
    end

    def matches? request
      versioned_accept_header?(request) || version_one?(request)
    end

    private

    def vendor_application_id
      # abstract
    end

    def version_one? request
      @version == 1 && unversioned_accept_header?(request)
    end

    def versioned_accept_header? request
      accept = request.headers['Accept']
      accept && accept[/application\/vnd\.#{vendor_application_id}-v#{@version}\+json/]
    end

    def unversioned_accept_header? request
      accept = request.headers['Accept']
      accept.blank? || accept[/application\/vnd\.#{vendor_application_id}/].nil?
    end
  end
end
end
