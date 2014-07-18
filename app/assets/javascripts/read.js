$(document).on('page:change', function() {


var getJSON = function(url, successHandler, errorHandler) {
    var xhr = new XMLHttpRequest();
    xhr.open('get', url, true);
    alert("-------" + url);
    //xhr.responseType = 'json';
    xhr.onload = function() {
       var status = xhr.status;
       alert("===========" + status);
       if (status == 200) {
          successHandler && successHandler(xhr.response);
       } else {
          errorHandler && errorHandler(status);
       }
    };
    xhr.send();
 };

  function getReading() {
    var url = "http://www.buzzfeed.com/samstryker/call-edison-twentysomethings-need-some-inventions"
    $.getJSON("https://www.readability.com/api/content/v1/parser?url="+ url +"&token=1b830931777ac7c2ac954e9f0d67df437175e66e",
    function (data) {
      alert(data.content);
  });
}

});