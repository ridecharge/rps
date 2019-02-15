// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(function() {
	var modal = document.getElementById('myModal');
	var btn = document.getElementsByClassName("myBtn");
	var info = document.getElementById("info");
	var upd = document.getElementById("update");
	var span = document.getElementsByClassName("close")[0];
	var modalContent = document.getElementsByClassName("modal-content")[0];
	[...document.querySelectorAll(".myBtn")].map(
		function(element, index, array) {
			element.onclick = function() {
			  modal.style.display = "block";
			  info.style.display = "block";
			  upd.style.display = "none";
			  var oImg = document.createElement("img");
			  oImg.setAttribute('src', 'assets' + element.id );
		  	  var item = document.getElementById("user_throw");
		  	  item.replaceChild(oImg, item.childNodes[0]);
			}
		}
	);
	span.onclick = function() {
	  modal.style.display = "none";
	 	modalContent.style.height = "470px";
		modalContent.style.width = "880px";  
	};
});