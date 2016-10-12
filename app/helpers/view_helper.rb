def format_url(url, client)
  url.partition(client.root_url)[-1]
end

def group_payloads(payloads, hour = 0, breakdown={})
  return breakdown if hour == 24
    grouped_payloads = payloads.where("extract(hour from requested_at) between #{hour} and #{hour+1}").group(:event_id).count
    breakdown[hour] = translate_grouped_keys(grouped_payloads)
    hour += 1
    group_payloads(payloads, hour, breakdown)
end
