# reverseGeo
An interface for the reverse geocoding service by Google Maps Geocoding API's.

## How to install
```{r}
library(devtools)
install_github('alexplatasl/reverseGeo')
library(reverseGeo)
```

## Examples
We have some lat-lon coordinates

|LONGITUD	    |LATITUD   |
|------------:|---------:|
|-101.250221	|21.009609 |
|-96.8833135 	|19.5152055|
|-99.1285785	|19.4314637|
|-103.351945	|20.6595362|
|-100.3160587	|25.6844196|

```{r}
coords = data.frame(
	longitud = c(-101.250221, -96.8833135, -99.1285785, -103.351945, -100.3160587),
	latitud = c(21.009609, 19.5152055, 19.4314637, 20.6595362, 25.6844196)
)

results = c()
for (i in 1:nrow(coords)){
	results[i] = reverseGeo(lat = coords$latitud[i], 
					lon =coords$longitud[i],
					key = YourAPIkey)
}
results
```

```{r results}
> results
[1] "Paseo Madero 34, Zona Centro, 36000 Guanajuato, Gto.,"                  
[2] "Calle 7 - 18 19, Pastoresa, 91193 Xalapa Enríquez, Ver.,"               
[3] "Corregidora 40, Centro Histórico, Centro, 06000 Ciudad de México, CDMX,"
[4] "Carteros 1047, Moderna, 44190 Guadalajara, Jal.,"                       
[5] "Av Francisco I. Madero 373, Centro, 64000 Monterrey, N.L.," 
```
