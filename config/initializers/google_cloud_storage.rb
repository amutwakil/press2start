require "google/cloud/storage"

def credentials_for_gcs
    keyfile_path = Rails.root.join("config", "secrets", "iron-tea-456720-t4-f0d4cf99c6bf.json")
    unless File.exists? keyfile_path
        raise "your secret json file is missing"
    end
    Google::Auth::Credentials.new keyfile_path
end

Rails.application.config.google_cloud_storage = Google::Cloud::Storage.new(
project_id: Rails.application.credentials.dig(:google_cloud, :project_id),
# Configure in config/credentials.yml.enc
credentials: credentials_for_gcs
)

Rails.application.config.gcs_bucket_name = 'p2s_gc_storage'
