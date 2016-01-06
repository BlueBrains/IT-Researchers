IO.setSaveXMLFunction(function(uri, doc) {
  alert('amer'+uri);
  s=new XMLSerializer().serializeToString(doc.documentElement);
  alert(s);
  //console.log(s);
       var http = new XMLHttpRequest();
		var url = "http://localhost:3000/researcher/create_xml_temp";
		var params = "doc="+s;
		http.open("POST", url, true);

		//Send the proper header information along with the request
		http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		http.setRequestHeader("Content-length", params.length);
		http.setRequestHeader("Connection", "close");

		http.onreadystatechange = function() {//Call a function when the state changes.
		    if(http.readyState == 4 && http.status == 200) {
		        alert(http.responseText);
		    }
		}
		http.send(params);
       
    
  
});
