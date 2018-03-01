json.array! @printers do |printer|
  json.extract! printer, :name, :location, :media, :weight, :duplex
end
