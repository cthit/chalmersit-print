json.array! @printers do |printer|
  json.name printer.name
  json.location printer.location
  json.media printer.media
  json.weight printer.weight
  json.duplex printer.duplex
end
