function testURL(str) {
  var pattern = new RegExp('^(https?:\/\/)?' + '((([a-z\d]([a-z\d-]*[a-z\d])*)\.)+[a-z]{2,}|'+ 
      '((\d{1,3}\.){3}\d{1,3}))'+ '(\:\d+)?(\/[-a-z\d%_.~+]*)*'+ 
    '(\?[;&a-z\d%_.~+=-]*)?'+ '(\#[-a-z\d_]*)?$','i'); 
  if(!pattern.test(str)) {
    return false;
  } else {
    return true;
  }
}

function gotoURL() {
    var url = document.getElementById('link').value;
    if(testURL(url)) {
        window.location.href = url;
    } else {
        alert("Please enter a valid URL!");
    }
    
}