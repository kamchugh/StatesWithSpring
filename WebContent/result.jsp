<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="States.css" />
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>States</title>

</head>
<body>
	<header>
	<p class="headertext">US States</p>
	</header>
	<div>
		<c:choose>
			<c:when test="${! empty state}">
				<table class="statetable2">
					<tr>
						<td>
							<form action="GetStateData.do" method="GET">
								<p>Name:</p>
								<input type="text" name="name" />
						</td>
						<td><input type="submit" value="Get State Data" /></td>
						<tr>
	</form>

				</table>

				
	<table class="statetable2">
							<tr>
						<td colspan="2">
							<h1 class="headertext">Information for ${state.name}</h1>
						</td>
					</tr>
					<tr>
						<td>

							<p>Abbreviation: ${state.abbreviation}</p>
							<p>Capital: ${state.capital}</p>
							<p>Capital Population: ${state.population}</p>
							<p>State Dessert: ${state.dessert }</p> </c:when> <c:otherwise>
								<p>No state found</p>
							</c:otherwise> </c:choose> <img src="./Images/${state.abbreviation}.png" />
						</td>
						<td><script
										src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
							<script type="text/javascript"
										src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
							<script language="javascript" type="text/javascript">

    var map;
    var geocoder;
    function InitializeMap() {

        var latlng = new google.maps.LatLng(${state.latitude}, ${state.longitude});
        var myOptions =
        {
            zoom: 8,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: true
        };
        map = new google.maps.Map(document.getElementById("map"), myOptions);
    }

    function FindLocaiton() {
        geocoder = new google.maps.Geocoder();
        InitializeMap();

        var address = document.getElementById("addressinput").value;
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });

            }
            else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });

    }


    function Button1_onclick() {
        FindLocaiton();
    }

    window.onload = InitializeMap;

</script>
							<table>

								<tr>
									<td colspan="2">

										<div id="map" style="height: 253px; width: 400px"></div>

									</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td>
							<form action="submit.do" method="GET">
							<input type="submit" name="previous" value="previous" />
								
						
								</td>
						<td><input type="submit" name="next" value="next" />
						</td>
						</form>
					</tr>
					
					</td>
					</tr>
				</table>
	
					</div>



	<!-- </head>
</body> -->
	<footer>
	<p>Designed by Kaylee McHugh</p>
	</footer>

</html>