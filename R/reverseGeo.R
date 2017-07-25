reverseGeo = function(lat,lon,key){
	COORD = paste(lat,lon, collapse=",")
	request = paste("https://maps.googleapis.com/maps/api/geocode/json?latlng=",
			COORD,
			"&key=",key,sep="")
	con = url(request)
	direccion = readLines(con)
	close(con)
  # 50 requests per second
	Sys.sleep(0.02)  

	direccion = ifelse(is.na(grep("formatted_address", direccion, value=T)[1]),
				"Zero results",
				grep("formatted_address", direccion, value=T)[1]
			)

	direccion = gsub("^.*: .","",direccion)
	direccion = gsub(" Mexico.*$","",direccion)
	return(direccion)
}