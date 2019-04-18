include Swagger::Docs::ImpotentMethods

class Swagger::Docs::Config
  def self.base_api_controller
    Api::BaseController
  end
end

Swagger::Docs::Config.register_apis(
  {
    "1.0" => {
      api_extension_type: :json,
      api_file_path: "public/",
      base_path: BASE_URL
    }
  }
)
