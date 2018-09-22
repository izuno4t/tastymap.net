//<![CDATA[

function load() {
    if (GBrowserIsCompatible()) {
		var map = new GMap2(document.getElementById("map"));

		function GetInitZoom(){
		    return ( 12 );
		}
	
		function GetInitData(){
		    return [34.701909, 135.494977, GetInitZoom()];
		}
	
		function getFirstData(){
		    var data = location.href.split('?')[1];
		    var lat, lng;
		    var zoom = GetInitZoom();
		    if(data){
				var qs = data.split('&');
				for(var i in qs){
				    var q = qs[i].split('=');
				    if(q[0]=='lat') lat = parseFloat( q[1] );
				    if(q[0]=='lng') lng = parseFloat( q[1] );
				    if(q[0]=='zoom') zoom = parseFloat( q[1] );
				}
		    } else {
				return GetInitData();
		    }
		    if(!lat) return GetInitData();
		    if(!lng) return GetInitData();
		    return [lat, lng, zoom];
		}

		var FirstData = getFirstData();
	
		var first_position = new GLatLng( FirstData[0], FirstData[1] );
		map.setCenter( first_position, FirstData[2] );
		map.addControl( new GLargeMapControl() );
		map.addControl( new GMapTypeControl() );
	
		// markerを追加する関数
		function addMarker( map, lat, lng, name, cat, url, mixi, id ){
			var mkr_point = new GLatLng( lat, lng );
			var mkr = new GMarker( mkr_point );
			map.addOverlay( mkr );
		
			// html 作成
			var html = '<h2><a href="/stores/show/' + id + '?from=/stores/list">' + name + '</a></h2><p>カテゴリ:' + cat + '</p>';
			if( url.length != 0 ){
				html += "<br /><a href="+url+" target=&uml;_blank&uml;>Webサイト</a>";
			}
			if( mixi.length != 0 ){
				html += " <a href="+mixi+" target=&uml;_blank&uml;>my mixi</a>";
			}
			html += "</div>";
		
			GEvent.addListener( mkr, "click", function(){
					this.openInfoWindowHtml( html );
				} );
			}
	 
	        // xml http request
	        var request = GXmlHttp.create();
	        request.open( "GET", "/map/xml", true );
	        // call back
	        request.onreadystatechange = function() {
			    if( 4 == request.readyState ){
					var res = request.responseXML;
					var xmlDoc = res.documentElement;
					var markers = xmlDoc.getElementsByTagName( "marker" );
					
					for( var i = 0; i < markers.length; i++ ){
			
					    // データを読み込み
					    var mkr_lat = parseFloat( markers[i].getAttribute("lat") );
					    var mkr_lng = parseFloat( markers[i].getAttribute("lng") );
					    var mkr_name = markers[i].getAttribute("name");
					    var mkr_cat = markers[i].getAttribute("category");
					    var mkr_url = markers[i].getAttribute("url");
					    var mkr_mixi = markers[i].getAttribute("mixi");
						var mkr_id = markers[i].getAttribute("id");
					    addMarker( map, mkr_lat, mkr_lng, mkr_name, mkr_cat, mkr_url, mkr_mixi, mkr_id );
					}
			    }
	        }
	        request.send( null );
	    }
}

//]]>

