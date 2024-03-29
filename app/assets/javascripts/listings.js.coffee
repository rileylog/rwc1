$ ->
  mapOptions =
    center: new google.maps.LatLng(40.5999605, -111.747028)
    zoom: 9
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map($("#map_canvas.listings")[0], mapOptions)

  map.data.loadGeoJson('/get-listings-data.json')

  map.data.addListener 'click', (event) ->
    $('#listing_title').html "#{event.feature.getProperty "name"} Listings"
    $('#area_policy').html event.feature.getProperty "policy"
    wanteds = event.feature.getProperty "wanteds"
    for_sales = event.feature.getProperty "for_sales"
    if wanteds.length > 0
      $('#wanted').html(
        for wanted in wanteds
          "<div><h5>#{wanted.volume} ac-ft</h5><p>#{wanted.source} | #{wanted.description}</p></div>"
      )
    else
      $('#wanted').html(
          "<div><h5>No wanted listings for this area.</h5></div>"
      )
    if for_sales.length > 0
      $('#for_sale').html(
        for for_sale in for_sales
          "<div><h5>#{for_sale.volume} ac-ft | $#{for_sale.price}/ac-ft</h5><p>#{for_sale.source} | #{for_sale.description}</p></div>"
      )
    else
      $('#for_sale').html(
          "<div><h5>No for sale listings for this area.</h5></div>"
      )
    return