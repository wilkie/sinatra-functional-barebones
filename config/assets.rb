class Application < Sinatra::Base
  register Sinatra::AssetPack

  assets do
    serve '/javascripts', from: 'public/javascripts'
    serve '/stylesheets', from: 'public/stylesheets'
    serve '/images',      from: 'public/images'
    # %%DELETE%% js_compression
    # %%DELETE%% css_compression
  end
end
