class Admin::SiteSettingsController < Admin::AdminController

  def index
    site_settings = SiteSetting.all_settings
    info = {site_settings: site_settings, diags: SiteSetting.diags }
    render_json_dump(info.as_json)
  end

  def update
    params.require(:value)
    SiteSetting.send("#{params[:id]}=", params[:value])
    render nothing: true
  end

end
