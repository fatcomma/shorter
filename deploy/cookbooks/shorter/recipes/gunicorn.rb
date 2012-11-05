execute "start gunicorn_django" do
    command "gunicorn_django --daemon --bind=127.0.0.1:8000 /opt/shorter/shorten"
end
