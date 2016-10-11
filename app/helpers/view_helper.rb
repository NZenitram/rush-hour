def format_url(url, client)
  url.partition(client.root_url)[-1]
end
