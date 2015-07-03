/* Events from UI */

        //var region = document.getElementById('region');

var picker = document.getElementById('devicePicker');
var deviceId = picker.options[picker.selectedIndex].value;
var baseUrl = "http://dweet.io/get/dweets/for/";
var defaultDevice = "urbansense-aqid-one"
var data;
// = _.map(rawdata['with'], function(d){return {"url":d['thing'],"timestamp":d['created'],"latitude":parseFloat(d['content']['gpsLocation']['latitude']),"longitude":parseFloat(d['content']['gpsLocation']['longitude']),"temperature":parseFloat(d['content']['temperature']['value']),"humidity":parseFloat(d['content']['humidity']['value']),"concentration":parseFloat(d['content']['concentration']['value'])}})		

var chartDim = Math.min(document.getElementById('map').clientWidth, window.innerHeight - document.querySelector('header').clientHeight) - 20;	    
var chartWidthDim = Math.min(document.getElementById('map').clientWidth, window.innerHeight - document.querySelector('header').clientHeight) - 20;
var chartHeightDim =  (window.innerHeight - document.querySelector('header').clientHeight)/6;


	picker.addEventListener('change', function(e){
		deviceId = picker.options[picker.selectedIndex].value;
		console.log(deviceId);	    
	    getData(baseUrl+deviceId);
	    drawCharts();
	    
	}, false);
	    
	var isRunning = true;
	var button = document.getElementById('toggle');

	button.addEventListener('click', function(e){
		if(isRunning) {
			//pubnub.unsubscribe({
			//	channel: channel
			//});
			button.value = 'Stream again';
			isRunning = false;
		} else {
			//getData();
			button.value = 'Stop me!';
			isRunning = true;
		}
		
	}, false);



//var rawdata = {"this":"succeeded","by":"getting","the":"dweets","with":[
//    {"thing":"urbansense-aqid-one","created":"2015-06-14T08:18:03.460Z","content":{"gpsLocation":{"latitude":18.993823,"altitude":0,"name":"urbansense-aqid-one","longitude":72.826957,"accuracy":0},"concentration":{"value":"119.8"},"deviceId":1,"temperature":{"value":"30.76"},"humidity":{"value":"91"}}},
//    {"thing":"urbansense-aqid-one","created":"2015-06-14T08:17:03.381Z","content":{"gpsLocation":{"latitude":18.993823,"altitude":0,"name":"urbansense-aqid-one","longitude":72.826957,"accuracy":0},"concentration":{"value":"154.9"},"deviceId":1,"temperature":{"value":"37.26"},"humidity":{"value":"37"}}}]}

	    function getData(url) {		    
		console.log(url);
		d3.json(url, function(error, json) {
		    rawdata = json;
		    processData(json);
		    //console.log(data);
		}, false);
	    }
					       
	    function processData(rawdata) {
		try {		    
		    data = _.map(rawdata['with'], function(d){return {"url":d['thing'],"timestamp":d['created'],"latitude":parseFloat(d['content']['gpsLocation']['latitude']),"longitude":parseFloat(d['content']['gpsLocation']['longitude']),"temperature":parseFloat(d['content']['temperature']['value']),"humidity":parseFloat(d['content']['humidity']['value']),"concentration":parseFloat(d['content']['concentration']['value'])}})	
		}
		catch(err) {
		    data = _.map(rawdata['with'], function(d){return {"url":d['thing'],"timestamp":d['created'],"latitude":parseFloat(d['content']['gpsLocation']['latitude']),"longitude":parseFloat(d['content']['gpsLocation']['longitude']),"temperature":parseFloat(d['content']['temperature']['value']),"humidity":parseFloat(d['content']['humidity']['value']),"concentration":parseFloat(d['content']['concentration']['value'])}})	
		}
				
	    //fr AQI Mapping 
	    var parseDate = d3.time.format("%Y-%m-%dT%H:%M:%S.%LZ").parse;
	    data.forEach(function(d) {
		d.date = parseDate(d.timestamp);
		d.total= Math.ceil(d.temperature+d.humidity+d.concentration);
		d.Year = d.date.getFullYear();
	    });

		drawCharts();
	    }


            function drawCharts(){
		var ndx = crossfilter(data);
		var dateDim = ndx.dimension(function(d) { return d.date;});
		var concDim = ndx.dimension(function(d) { return d.concentration; });   
		var humidityDim = ndx.dimension(function(d) { return d.humidity; });   
		var tempDim = ndx.dimension(function(d) { return d.temperature; });   
		var minDate = dateDim.bottom(1)[0].date;
		var maxDate = dateDim.top(1)[0].date;


		// Charts

		var conclineChart  = dc.lineChart("#chart-line-concperday"); 
		var concfluctuationChart = dc.barChart('#conc-fluctuation-chart');
		var tempfluctuationChart = dc.barChart('#temp-fluctuation-chart');
		var humfluctuationChart = dc.barChart('#hum-fluctuation-chart');

		var dimwidth = chartWidthDim;
		var dimheight=chartHeightDim;

		var totalDim = ndx.dimension(function(d) { return d.total; });   
		var concGroup = dateDim.group().reduceSum(function(d) {return d.concentration;}); 
		var tempGroup = dateDim.group().reduceSum(function(d) {return d.temperature;}); 
		var humidityGroup = dateDim.group().reduceSum(function(d) {return d.humidity;}); 

		var yearDim  = ndx.dimension(function(d) {return +d.Year;});
		var year_total = yearDim.group().reduceSum(function(d) {return d.total;});
		var yearRingChart   = dc.pieChart("#chart-ring-year");


		conclineChart
		    .width(chartWidthDim).height(chartHeightDim)
		    .dimension(dateDim)
		    .group(concGroup)
		    .x(d3.time.scale().domain([minDate,maxDate]))
		    .xAxisLabel("Time")
		    .yAxisLabel("PM 10");

		concfluctuationChart
		    .width(chartWidthDim).height(chartHeightDim)
		    .dimension(dateDim)
		    .group(concGroup)
		    .x(d3.time.scale().domain([minDate,maxDate]))
		    .xAxisLabel("Time")
		    .yAxisLabel("PM 2.5");

		tempfluctuationChart
		    .width(chartWidthDim).height(chartHeightDim)
		    .dimension(dateDim)
		    .group(tempGroup)
		    .x(d3.time.scale().domain([minDate,maxDate]))
		    .xAxisLabel("Time")
		    .yAxisLabel("Temperature");


		humfluctuationChart
		    .width(chartWidthDim).height(chartHeightDim)
		    .dimension(dateDim)
		    .group(humidityGroup)
		    .x(d3.time.scale().domain([minDate,maxDate]))
		    .xAxisLabel("Time")
		    .yAxisLabel("Humidity");


		yearRingChart
		    .width(chartWidthDim/6).height(chartWidthDim/6)
		    .dimension(yearDim)
		    .group(year_total)
		    .innerRadius(10); 

		dc.renderAll();

	    }

	    // Misc Vars

	    function print_filter(filter){
		var f=eval(filter);
		if (typeof(f.length) != "undefined") {}else{}
		if (typeof(f.top) != "undefined") {f=f.top(Infinity);}else{}
		if (typeof(f.dimension) != "undefined") {f=f.dimension(function(d) { return "";}).top(Infinity);}else{}
		console.log(filter+"("+f.length+") = "+JSON.stringify(f).replace("[","[\n\t").replace(/}\,/g,"},\n\t").replace("]","\n]"));
	    } 

(function(){
    getData(baseUrl+defaultDevice);    
})();





	    //var conc_1 = concDim.filter(154.9); 
	    //print_filter("conc_90");
