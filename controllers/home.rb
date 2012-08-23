class Application
  get '/' do
    @name = "wilkie"
    @bio  = "I help people make new things."
    haml :"home/index"
  end
end
